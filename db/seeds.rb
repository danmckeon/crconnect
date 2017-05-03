require 'zip'
require 'csv'

def create_data_dir(data_dir_path)
  if !Dir.exists?(data_dir_path)
    Dir.mkdir(data_dir_path)
  end
end

def assign_parent_dir_name
  parent_dir_name = "CTDOTGOV_UPLOAD_" + Time.now.to_i.to_s
end

def create_upload_directories(parent_dir_path, zip_dir_path, xml_dir_path)
  Dir.mkdir(parent_dir_path)
  Dir.mkdir(zip_dir_path)
  Dir.mkdir(xml_dir_path)
end

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

def clean_raw_age(raw_age, default_age)
  raw_age_arr = raw_age.split(' ')
  if raw_age_arr[1] == "Years"
    age = raw_age_arr[0]
  else
    age = default_age
  end
  age
end

def find_trial_sites(trial_xml)
  sites = []
  trial_xml.xpath("//location").each do |site|
    status = site.at("status").text if site.at("status")
    if status == "Recruiting"
      new_site = Site.new
      new_site.name = site.at("name").text if site.at("name")
      new_site.city = site.at("city").text if site.at("city")
      new_site.state = site.at("state").text if site.at("state")
      new_site.zip = site.at("zip").text if site.at("zip")
      new_site.country = site.at("country").text if site.at("country")
      new_site.status = site.at("status").text if site.at("status")
      new_site.contact_name = site.at("contact/last_name").text if site.at("contact/last_name")
      new_site.contact_phone = site.at("contact/phone").text if site.at("contact/phone")
      new_site.contact_phone_ext = site.at("contact/phone_ext").text if site.at("contact/phone_ext")
      new_site.contact_email = site.at("contact/email").text if site.at("contact/email")
      new_site.investigator_name = site.at("investigator/last_name").text if site.at("investigator/last_name")
      new_site.investigator_role = site.at("investigator/role").text if site.at("investigator/role")
      new_site.save
      sites << new_site
    end
  end
  sites
end

def create_trial_from_xml(trial_xml)
  trial = Trial.new
  trial[:org_study_id] = trial_xml.xpath("//id_info//org_study_id").text
  trial[:secondary_id] = trial_xml.xpath("//id_info//secondary_id").text
  trial[:nct_id] = trial_xml.xpath("//nct_id").text
  trial[:nct_alias] = trial_xml.xpath("//nct_alias").text
  trial[:brief_title] = trial_xml.xpath("//brief_title").text
  trial[:official_title] = trial_xml.xpath("//official_title").text
  trial[:lead_sponsor_name] = trial_xml.xpath("//sponsors//lead_sponsor//agency").text
  trial[:lead_sponsor_class] = trial_xml.xpath("//sponsors//lead_sponsor//agency_class").text
  trial[:brief_summary] = trial_xml.xpath("//brief_summary//textblock").text
  trial[:detailed_description] = trial_xml.xpath("//detailed_description//textblock").text
  trial[:overall_status] = trial_xml.xpath("//overall_status").text
  trial[:start_date] = trial_xml.xpath("//start_date").text
  trial[:phase] = trial_xml.xpath("//phase").text
  trial[:study_type] = trial_xml.xpath("//study_type").text
  trial[:study_design] = trial_xml.xpath("//study_design").text
  trial[:primary_outcome_measure] = trial_xml.xpath("//primary_outcome//measure").text
  trial[:primary_outcome_time_frame] = trial_xml.xpath("//primary_outcome//time_frame").text
  trial[:primary_outcome_safety_issue] = trial_xml.xpath("//primary_outcome//safety_issue").text
  trial[:secondary_outcome_measure] = trial_xml.xpath("//secondary_outcome//measure").text
  trial[:secondary_outcome_time_frame] = trial_xml.xpath("//secondary_outcome//time_frame").text
  trial[:secondary_outcome_safety_issue] = trial_xml.xpath("//secondary_outcome//safety_issue").text
  trial[:number_of_groups] = trial_xml.xpath("//number_of_arms").text
  trial[:enrollment] = trial_xml.xpath("//enrollment").text
  trial[:condition] = trial_xml.xpath("//condition").text
  trial[:arm_group_label] = trial_xml.xpath("//arm_group//arm_group_label").text
  trial[:arm_group_description] = trial_xml.xpath("//arm_group//description").text
  trial[:eligibility_criteria_text] = trial_xml.xpath("//eligibility//criteria//textblock").text
  trial[:gender] = trial_xml.xpath("//eligibility//gender").text
  trial[:minimum_age] = clean_raw_age(trial_xml.xpath("//eligibility//minimum_age").text, "0")
  trial[:maximum_age] = clean_raw_age(trial_xml.xpath("//eligibility//maximum_age").text, "150")
  trial[:overall_official_name] = trial_xml.xpath("//overall_official//last_name").text
  trial[:overall_official_role] = trial_xml.xpath("//overall_official//role").text
  trial[:overall_official_affiliation] = trial_xml.xpath("//overall_official//affiliation").text
  trial[:overall_contact_name] = trial_xml.xpath("//overall_contact//last_name").text
  trial[:overall_contact_email] = trial_xml.xpath("//overall_contact//email").text
  trial[:overall_contact_phone] = trial_xml.xpath("//overall_contact//phone").text
  trial[:results_reference_citation] = trial_xml.xpath("//results_reference//citation").text
  trial[:results_reference_PMID] = trial_xml.xpath("//results_reference//pmid").text
  trial[:verification_date] = trial_xml.xpath("//verification_date").text
  trial[:lastchanged_date] = trial_xml.xpath("//lastchanged_date").text
  trial[:firstreceived_date] = trial_xml.xpath("//firstreceived_date").text
  trial[:responsible_party_type] = trial_xml.xpath("//responsible_party_type").text
  trial[:keyword] = trial_xml.xpath("//keyword").text
  trial[:is_fda_regulated] = trial_xml.xpath("//is_fda_regulated").text
  trial[:has_expanded_access] = trial_xml.xpath("//has_expanded_access").text
  trial[:condition_browse_mesh_term] = trial_xml.xpath("//condition_browse//mesh_term").text
  trial.save
  trial
end


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
parent_dir_name = assign_parent_dir_name
parent_dir_path = Rails.root.join('tmp', 'data', parent_dir_name)
zip_dir_path = Rails.root.join('tmp', 'data', parent_dir_name, 'ZIP')
xml_dir_path = Rails.root.join('tmp', 'data', parent_dir_name, 'XML')
all_trial_xmls = xml_dir_path + '*.xml'

create_data_dir(data_dir_path)

# create necessary directories for zip upload and extraction to xmls
create_upload_directories(parent_dir_path, zip_dir_path, xml_dir_path)

# download zip file to directory and unzip to xmls

download_zip_file(LUNG_OR_COLO_OPEN_UPLOAD_URL, zip_dir_path, xml_dir_path)
download_zip_file(LUNG_OR_COLO_ACTIVENR_UPLOAD_URL, zip_dir_path, xml_dir_path)

Trial.destroy_all
Site.destroy_all

# parse xml files to Trial objects

Dir.glob(all_trial_xmls) do |xml_file|
  xml_file_noko = Nokogiri::XML(File.open(xml_file))
  create_trial_from_xml(xml_file_noko)
end

lung_and_colo_csv = File.join(Rails.root, 'db', 'seed_data', 'lung_and_colo.csv')

missing_trials = []

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
    trial.sites = find_trial_sites(Nokogiri::XML(File.open(new_trial_path)))
    trial.save
  else
    missing_trials << row[0]
  end
end

if missing_trials.length > 0
  puts "Trials appearing in csv, but not seeded to database by Nokogiri:"
  missing_trials.each { |trial| puts trial }
end
