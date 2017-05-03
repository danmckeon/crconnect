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


def find_lat_long_within_db(missing_lat_long_sites)
  missing_lat_long_sites.each do |missing_lat_long_site|
    if missing_lat_long_site.zip
      potential_matches = Site.where(zip: missing_lat_long_site.zip)
      potential_matches.each do |potential_match|
        if !potential_match.latitude.nan?
          missing_lat_long_site.latitude = potential_match.latitude
          missing_lat_long_site.longitude = potential_match.longitude
          missing_lat_long_site.save
        end
      end
    # elsif site.state
    #   location_input = "#{site.city}, #{site.state}"
    end
  end
end
