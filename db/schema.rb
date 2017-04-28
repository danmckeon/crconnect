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


ActiveRecord::Schema.define(version: 20170428030039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"



  create_table "trials", force: :cascade do |t|
    t.string   "nct_id"
    t.string   "phase"
    t.string   "sponsor_name"
    t.string   "sponsor_type"
    t.string   "study_title"
    t.string   "cohort"
    t.string   "age_min"
    t.string   "age_max"
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
  end

end
