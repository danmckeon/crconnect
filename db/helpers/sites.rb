require 'csv'

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

def save_lat_long_to_csv(all_sites)
  CSV.open(Rails.root.join('db', 'seed_data', 'all_sites.csv'), 'wb') do |csv|
    csv << ["nct_id", "name", "city", "state", "zip", "country", "status",
      "contact_name", "contact_phone", "contact_phone_ext", "contact_email",
      "investigator_name", "investigator_role", "latitude", "longitude"]
    if !site.latitude.nan?
      all_sites.each do |site|
        if site.trial
          csv << [site.trial.nct_id, site.name, site.city, site.state, site.zip,
            site.country, site.status, site.contact_name, site.contact_phone,
            site.contact_phone_ext, site.contact_email, site.investigator_name,
            site.investigator_role, site.latitude, site.longitude]
        end
      end
    end
  end
end
