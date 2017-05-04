FactoryGirl.define do
  factory :site do
    name "University of Wisconsin Hospital and Clinics"
    city "Madison"
    state "Wisconsin"
    zip "53792"
    country "United States"
    status "Recruiting"
    contact_name "Andrew J Tatar"
    contact_phone "608-263-2901"
    contact_email "atatar@wis.edu"
    investigator_name "Dustin Deming, MD"
    investigator_role "Principal Investigator"
    latitude 43.0772547
    longitude (-89.430773)
  end

  factory(:site2, class: Site) do
    name "Seattle Cancer Care Alliance"
    city "Seattle"
    state "Washington"
    zip "98109"
    country "United States"
    status "Recruiting"
    contact_name "Dean"
    contact_phone "206-555-2324"
    contact_email "dean@scca.org"
    latitude 47.6288591
    longitude (-122.3456919)
  end
end
