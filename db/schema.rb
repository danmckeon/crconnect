# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170502213343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "status"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_phone_ext"
    t.string   "contact_email"
    t.string   "investigator_name"
    t.string   "investigator_role"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "trials", force: :cascade do |t|
    t.string   "nct_id"
    t.string   "phase"
    t.string   "lead_sponsor_name"
    t.string   "lead_sponsor_class"
    t.string   "brief_title"
    t.string   "cohort"
    t.string   "minimum_age"
    t.string   "maximum_age"
    t.string   "type_lung_nsclc_adeno"
    t.string   "type_lung_nsclc_large"
    t.string   "type_lung_nsclc_squamous"
    t.string   "type_lung_sclc"
    t.string   "stage_i"
    t.string   "stage_ii"
    t.string   "stage_iii"
    t.string   "stage_iv"
    t.string   "stage_sclc_ls"
    t.string   "stage_sclc_es"
    t.string   "status_newly_diagnosed"
    t.string   "status_relapse"
    t.string   "status_refractory"
    t.string   "marker_alk_oncogene"
    t.string   "marker_egfr_mutation"
    t.string   "marker_kras_mutation"
    t.string   "treatment_radiation"
    t.string   "treatment_radiation_exclusion_period_mo"
    t.string   "treatment_chemo_systemic"
    t.string   "treatment_chemo_systemic_exclusion_period_mo"
    t.string   "treatment_chemo_adjuvant"
    t.string   "treatment_chemo_adjuvant_exclusion_period_mo"
    t.string   "treatment_tki"
    t.string   "treatment_tki_exclusion_period_mo"
    t.text     "eligibility_criteria_text"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "org_study_id"
    t.string   "secondary_id"
    t.string   "nct_alias"
    t.string   "official_title"
    t.string   "brief_summary"
    t.string   "detailed_description"
    t.string   "overall_status"
    t.string   "start_date"
    t.string   "study_type"
    t.string   "study_design"
    t.string   "primary_outcome_measure"
    t.string   "primary_outcome_time_frame"
    t.string   "primary_outcome_safety_issue"
    t.string   "secondary_outcome_measure"
    t.string   "secondary_outcome_time_frame"
    t.string   "secondary_outcome_safety_issue"
    t.string   "number_of_groups"
    t.string   "enrollment"
    t.string   "condition"
    t.string   "arm_group_label"
    t.string   "arm_group_description"
    t.string   "sampling_method"
    t.string   "gender"
    t.string   "healthy_volunteers"
    t.string   "overall_official_name"
    t.string   "overall_official_role"
    t.string   "overall_official_affiliation"
    t.string   "overall_contact_name"
    t.string   "overall_contact_phone"
    t.string   "overall_contact_email"
    t.string   "results_reference_citation"
    t.string   "results_reference_PMID"
    t.string   "verification_date"
    t.string   "lastchanged_date"
    t.string   "firstreceived_date"
    t.string   "responsible_party_type"
    t.string   "keyword"
    t.string   "is_fda_regulated"
    t.string   "has_expanded_access"
    t.string   "condition_browse_mesh_term"
    t.string   "type_colorectal_adeno"
    t.string   "type_colorectal_nonadeno"
  end

end
