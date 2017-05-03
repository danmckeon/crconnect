############### DATABASE HELPER METHODS FOR SITES ##############################

################################################################################

require 'csv'

# LOAD SITES FROM CSV STORED IN SEED_DATA TO DB VIA SEEDS.RB

def load_sites_from_csv(csv_path)
  CSV.foreach(csv_path, headers: true, encoding: 'BOM|UTF-8:UTF-8') do |row|
    trials = Trial.where(nct_id: row[0])
    trials.each do |trial|
      site = Site.create(row.to_hash.except('nct_id'))
      trial.sites << site
    end
  end
end

################################################################################

# FIND TRIAL SITES FROM XML

# Below method is for finding sites from xml files during Nokogiri scrape...
# currently finding sites via csv file to retain latitude/longitude data

def create_trial_sites_from_xml(trial_xml)
  sites = []
  trial_xml.xpath("//location").each do |site|
    status = site.at("status").text if site.at("status")
    country = site.at("country").text if site.at("country")
    if status == "Recruiting" && (country == "United States" || country == "Canada")
      new_site = Site.new
      new_site.name = site.at("name").text if site.at("name")
      new_site.city = site.at("city").text if site.at("city")
      new_site.state = site.at("state").text if site.at("state")
      new_site.zip = site.at("zip").text if site.at("zip")
      new_site.country = country
      new_site.status = status
      new_site.contact_name = site.at("contact/last_name").text if site.at("contact/last_name")
      new_site.contact_phone = site.at("contact/phone").text if site.at("contact/phone")
      new_site.contact_phone_ext = site.at("contact/phone_ext").text if site.at("contact/phone_ext")
      new_site.contact_email = site.at("contact/email").text if site.at("contact/email")
      new_site.investigator_name = site.at("investigator/last_name").text if site.at("investigator/last_name")
      new_site.investigator_role = site.at("investigator/role").text if site.at("investigator/role")
      lat_long = find_lat_long({ zip: new_site.zip, city: new_site.city, state: new_site.state, country: new_site.country })
      new_site.latitude = lat_long[0]
      new_site.longitude = lat_long[1]
      new_site.save
      sites << new_site
    end
  end
  sites
end

# Below method is for finding latitude and longitude via Geocoder, which uses
# Google API. Note that it is easy to exceed query limit with query of this size.
# As a result, we have saved sites in csv file relevant to current lung cancer
# and colorectal cancer trials in database.

def find_lat_long(sites)
  sites.each do |site|
    if site.zip
      location_input = site.zip
    elsif site.state
      location_input = "#{site.city}, #{site.state}"
    else
      location_input = "#{site.city}, #{site.country}"
    end
    coordinates = Geocoder::Calculations.extract_coordinates(location_input)
    site.latitude = coordinates[0]
    site.longitude = coordinates[1]
    site.save
  end
end

################################################################################

# MISC HELPER METHODS

# UTILIZE OTHER SITES IN DATABASE WITH SAME ZIP TO FIND LAT/LONG OF SITE OBJECTS
# WITH MISSING LAT/LONG

def find_lat_long_for_many_sites(missing_lat_long_sites)
  missing_lat_long_sites.each do |missing_lat_long_site|
    find_lat_long_for_individual_site(missing_lat_long_site)
  end
end

def find_lat_long_for_individual_site(missing_lat_long_site)
  if missing_lat_long_site.zip
    potential_matches = Site.where(zip: missing_lat_long_site.zip)
    potential_matches.each do |potential_match|
      if !potential_match.latitude.nan?
        missing_lat_long_site.latitude = potential_match.latitude
        missing_lat_long_site.longitude = potential_match.longitude
        missing_lat_long_site.save
        return
      end
    end
  end
end

# SAVING CURRENT SITE OBJECTS TO CSV

# Uncomment only if needing to save to csv
# sites_dest_csv_path = Rails.root.join('db', 'seed_data', 'all_sites.csv')

def save_lat_long_to_csv(all_sites)
  CSV.open(sites_dest_csv_path, 'wb') do |csv|
    csv << ["nct_id", "name", "city", "state", "zip", "country", "status",
      "contact_name", "contact_phone", "contact_phone_ext", "contact_email",
      "investigator_name", "investigator_role", "latitude", "longitude"]
    all_sites.each do |site|
      if site.trial && !site.latitude.nan?
        csv << [site.trial.nct_id, site.name, site.city, site.state, site.zip,
          site.country, site.status, site.contact_name, site.contact_phone,
          site.contact_phone_ext, site.contact_email, site.investigator_name,
          site.investigator_role, site.latitude, site.longitude]
      end
    end
  end
end
