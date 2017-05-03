############### DATABASE HELPER METHODS FOR TRIALS #############################

################################################################################

# CREATE TRIAL OBJECTS FROM XML FILE VIA SEEDS.RB

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

# CLEAN RAW AGE DATA FROM XML TO OUTPUT AGE STRING

def clean_raw_age(raw_age, default_age)
  raw_age_arr = raw_age.split(' ')
  if raw_age_arr[1] == "Years"
    age = raw_age_arr[0]
  else
    age = default_age
  end
  age
end
