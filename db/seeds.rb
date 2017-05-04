require 'zip'
require 'csv'
require_relative 'helpers/sites'
require_relative 'helpers/trials'

def download_zip_file(upload_url, zip_dir_path, xml_dir_path)
  # set destination for zip file download
  zip_destination = Rails.root.join(zip_dir_path, 'trials.zip')

  # download zip file to CTDOTGOV_UPLOAD_[TIMESTAMP]/ZIP
  open(zip_destination, 'wb') do |file|
    file << open(upload_url).read
  end

  # unzip file and save each xml to CTDOTGOV_UPLOAD_[TIMESTAMP]/XML
  Zip::File.open(zip_destination) do |zipfile|
    zipfile.each do |xml_file|
      xml_file_path = xml_dir_path + xml_file.name
      xml_file.extract(xml_file_path)
    end
  end
end

# api calls to clinicaltrials.gov
SHORT_SAMPLE_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond=hand+cancer&studyxml=true"
LONGER_SAMPLE_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="mouth+cancer"&studyxml=true]
LUNG_CANCER_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="lung+cancer"&phase=1&phase=2&studyxml=true]
COLORECTAL_CANCER_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="colon cancer"+OR+"rectal cancer"+OR+"colorectal cancer"+OR+"rectum cancer"&phase=1&phase=2&studyxml=true]
LUNG_OR_COLO_OPEN_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Open&cntry1=NA%3AUS&cond="lung+cancer"+OR+"colon cancer"+OR+"rectal cancer"+OR+"colorectal cancer"+OR+"rectum cancer"&phase=1&phase=2&studyxml=true]
LUNG_OR_COLO_ACTIVENR_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Active%2C+not+recruiting&cntry1=NA%3AUS&cond="lung+cancer"+OR+"colon cancer"+OR+"rectal cancer"+OR+"colorectal cancer"+OR+"rectum cancer"&phase=1&phase=2&studyxml=true]
LEUKEMIA_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="leukemia"&phase=1&phase=2&studyxml=true]
LYMPHOMA_UPLOAD_URL = %q[https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&cond="lymphoma"&phase=1&phase=2&studyxml=true]
FULL_UPLOAD_URL = "https://clinicaltrials.gov/ct2/results?term=&recr=Recruiting&cntry1=NA%3AUS&studyxml=true"


data_dir_path = Rails.root.join('tmp', 'data')
parent_dir_name = "CTDOTGOV_UPLOAD_" + Time.now.to_i.to_s
parent_dir_path = Rails.root.join('tmp', 'data', parent_dir_name)
zip_dir_path = Rails.root.join('tmp', 'data', parent_dir_name, 'ZIP')
xml_dir_path = Rails.root.join('tmp', 'data', parent_dir_name, 'XML')
all_trial_xmls = xml_dir_path + '*.xml'
lung_and_colo_csv = File.join(Rails.root, 'db', 'seed_data', 'lung_and_colo.csv')
sites_csv_path = Rails.root.join('db', 'seed_data', 'all_sites.csv')
missing_trials = []

Trial.destroy_all
Site.destroy_all

# create data directory if it doesn't exist
if !Dir.exists?(data_dir_path)
  Dir.mkdir(data_dir_path)
end

# create timestamped parent directory and xml/zip sub-directories
Dir.mkdir(parent_dir_path)
Dir.mkdir(zip_dir_path)
Dir.mkdir(xml_dir_path)

# download zip file to directory and unzip to xmls - multiple calls to
# download_zip_file acceptable as long as Trial nct_ids are not replicated
download_zip_file(LUNG_OR_COLO_OPEN_UPLOAD_URL, zip_dir_path, xml_dir_path)
download_zip_file(LUNG_OR_COLO_ACTIVENR_UPLOAD_URL, zip_dir_path, xml_dir_path)

# parse xml files to Trial objects
Dir.glob(all_trial_xmls) do |xml_file|
  xml_file_noko = Nokogiri::XML(File.open(xml_file))
  create_trial_from_xml(xml_file_noko)
end

# add data to trial objects from csv
CSV.foreach(lung_and_colo_csv, headers: true, encoding: 'BOM|UTF-8:UTF-8') do |row|
  new_trial_path = xml_dir_path + (row[0] + '.xml')
  if row[1] == "1"
    trial = Trial.find_by(nct_id: row[0])
  else
    if File.exist? File.expand_path new_trial_path
      xml_file_noko = Nokogiri::XML(File.open(new_trial_path))
      trial = create_trial_from_xml(xml_file_noko)
    end
  end
  if trial
    trial.update_attributes(row.to_hash)
    trial.save
  else
    missing_trials << row[0]
  end
end

# create site objects from csv
load_sites_from_csv(sites_csv_path)

# notifies user of any trials present in csv but absent from database
if missing_trials.length > 0
  puts "Trials appearing in csv, but not seeded to database by Nokogiri:"
  missing_trials.each { |trial| puts trial }
end
