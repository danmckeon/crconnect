class CreateTrials < ActiveRecord::Migration[5.0]
  def change
    create_table :trials do |t|
      t.string :nct_id
      t.string :phase
      t.string :sponsor_name
      t.string :sponsor_type
      t.string :study_title
      t.integer :cohort
      t.integer :age_min
      t.integer :age_max
      t.string :type_lung_nsclc_adeno
      t.string :type_lung_nsclc_large
      t.string :type_lung_nsclc_squamous
      t.string :type_lung_sclc
      t.string :stage_i
      t.string :stage_ii
      t.string :stage_iii
      t.string :stage_iv
      t.string :stage_sclc_ls
      t.string :stage_sclc_es
      t.string :status_newly_diagnosed
      t.string :status_relapse
      t.string :status_refractory
      t.string :marker_alk_oncogene
      t.string :marker_egfr_mutation
      t.string :marker_kras_mutation
      t.string :treatment_radiation
      t.string :treatment_radiation_exclusion_period_mo
      t.string :treatment_chemo_systemic
      t.string :treatment_chemo_systemic_exclusion_period_mo
      t.string :treatment_chemo_adjuvant
      t.string :treatment_chemo_adjuvant_exclusion_period_mo
      t.string :treatment_tki
      t.string :treatment_tki_exclusion_period_mo
      t.text :eligibility_criteria_text
      t.timestamps
    end
  end
end
