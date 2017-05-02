FactoryGirl.define do
  factory :trial do
    nct_id "NCT01622621"
    phase "Phase 2"
    brief_title "Randomized Phase II Trial of Stereotactic Body Radiotherapy (SBRT) Versus Sublobar Resection for High-Risk Patients With Early Stage Non-Small Lung Cancer (NSCLC)"
    cohort "1"
    minimum_age "18"
    maximum_age "150"
    type_lung_nsclc_adeno "include"
    type_lung_nsclc_large "include"
    type_lung_nsclc_squamous "include"
    stage_i "include"
    eligibility_criteria_text "\r        Inclusion Criteria\r\r          -  Patients must have a suspicious lung nodule for clinical stage I NSCLC.\r\r          -  Pathologic confirmation at the time of surgery is acceptable. Patients randomized to\r             SBRT require core biopsy for diagnosis prior to treatment.\r\r          -  Patient must have a mass \u0089ä_ 5 cm maximum diameter by CT size estimate that is clinical\r             stage I (T1N0, T2N0)\r\r          -  Patient must have a CT scan of the chest and upper abdomen and PET-scan within 60\r             days prior to date of registration.\r\r          -  Patient must have an Eastern Cooperative Oncology Group (ECOG) or Zubrod performance\r             status 0, 1, or 2.\r\r          -  Patient must meet at least one major criteria or meet a minimum of two minor criteria\r             as described below:\r\r        Major Criteria:\r\r          -  Forced expiratory volume in one second (FEV1) \u0089ä_ 50% predicted\r\r          -  Carbon monoxide diffusing capacity (DLCO) \u0089ä_ 50% predicted\r\r        Minor Criteria:\r\r          -  Age \u0089ä´75\r\r          -  FEV1 51-60% predicted\r\r          -  DLCO 51-60% predicted\r\r          -  Pulmonary hypertension (defined as a pulmonary artery systolic pressure greater than\r             40 mmHg) as estimated by echocardiography or right heart catheterization\r\r          -  Poor left ventricular function (defined as an ejection fraction of 40% or less)\r\r          -  Resting or Exercise Arterial oxygen partial pressure (pO2) \u0089ä_ 55 mm Hg or blood oxygen\r             saturation (SpO2) \u0089ä_ 88%\r\r          -  pCO2 > 45 mm Hg\r\r          -  Modified Medical Research Council (MMRC) Dyspnea Scale \u0089ä´ 3.\r\r        Exclusion Criteria\r\r          -  Patient must not have had previous intra-thoracic radiation therapy.\r\r          -  No prior malignancy except adequately treated non-melanoma skin cancer, in situ\r             cervical cancer, localized prostate cancer, stage 0 Chronic lymphocytic leukemia\r             (CLL), or other cancer disease-free > 3 yrs.\r      \r        Inclusion Criteria\r\r          -  Patients must have a suspicious lung nodule for clinical stage I NSCLC.\r\r          -  Pathologic confirmation at the time of surgery is acceptable. Patients randomized to\r             SBRT require core biopsy for diagnosis prior to treatment.\r\r          -  Patient must have a mass \u0089ä_ 5 cm maximum diameter by CT size estimate that is clinical\r             stage I (T1N0, T2N0)\r\r          -  Patient must have a CT scan of the chest and upper abdomen and PET-scan within 60\r             days prior to date of registration.\r\r          -  Patient must have an Eastern Cooperative Oncology Group (ECOG) or Zubrod performance\r             status 0, 1, or 2.\r\r          -  Patient must meet at least one major criteria or meet a minimum of two minor criteria\r             as described below:\r\r        Major Criteria:\r\r          -  Forced expiratory volume in one second (FEV1) \u0089ä_ 50% predicted\r\r          -  Carbon monoxide diffusing capacity (DLCO) \u0089ä_ 50% predicted\r\r        Minor Criteria:\r\r          -  Age \u0089ä´75\r\r          -  FEV1 51-60% predicted\r\r          -  DLCO 51-60% predicted\r\r          -  Pulmonary hypertension (defined as a pulmonary artery systolic pressure greater than\r             40 mmHg) as estimated by echocardiography or right heart catheterization\r\r          -  Poor left ventricular function (defined as an ejection fraction of 40% or less)\r\r          -  Resting or Exercise Arterial oxygen partial pressure (pO2) \u0089ä_ 55 mm Hg or blood oxygen\r             saturation (SpO2) \u0089ä_ 88%\r\r          -  pCO2 > 45 mm Hg\r\r          -  Modified Medical Research Council (MMRC) Dyspnea Scale \u0089ä´ 3.\r\r        Exclusion Criteria\r\r          -  Patient must not have had previous intra-thoracic radiation therapy.\r\r          -  No prior malignancy except adequately treated non-melanoma skin cancer, in situ\r             cervical cancer, localized prostate cancer, stage 0 Chronic lymphocytic leukemia\r             (CLL), or other cancer disease-free > 3 yrs.\r"
  end
  factory(:happy_submit, class: Trial) do
    nct_id "NCT01622621"
    phase "Phase 2"
    brief_title "Randomized Phase II Trial of Stereotactic Body Radiotherapy (SBRT) Versus Sublobar Resection for High-Risk Patients With Early Stage Non-Small Lung Cancer (NSCLC)"
    cohort "1"
    minimum_age "18"
    maximum_age "150"
    type_lung_nsclc_adeno "include"
    stage_i "include"
    status_relapse nil
    status_refractory nil
    status_newly_diagnosed nil
  end
  factory(:grumpy_submit, class: Trial) do
    nct_id "NCT01993810"
    phase "Phase 3"
    brief_title "Phase III Randomized Trial Comparing Overall Survi..."
    cohort "1"
    minimum_age "18"
    maximum_age "150"
    type_lung_nsclc_adeno "include"
    type_lung_nsclc_large "include"
    type_lung_nsclc_squamous "include"
    type_lung_sclc "include"
    stage_ii "include"
    stage_iii "include"
    treatment_chemo_systemic "exclude"
    status_relapse nil
    status_refractory nil
    status_newly_diagnosed nil
  end
  factory(:submission, class: Trial) do
    nct_id "NCT0199382111"
    phase "Phase 3"
    brief_title "Study of the effects of the Phase on the status"
    cohort "1"
    minimum_age "18"
    maximum_age "150"
    type_lung_nsclc_adeno "include"
    type_lung_nsclc_large "include"
    type_lung_nsclc_squamous "include"
    type_lung_sclc "include"
    stage_ii "include"
    stage_iii "include"
    treatment_chemo_systemic "exclude"
    status_relapse nil
    status_refractory nil
    status_newly_diagnosed nil
    marker_egfr_mutation "exclude"
    marker_kras_mutation nil
    marker_alk_oncogene "exclude"
  end
  factory(:submission2, class: Trial) do
    nct_id "NCT0199213812"
    phase "Phase 3"
    brief_title "Very important study"
    cohort "1"
    minimum_age "18"
    maximum_age "150"
    type_lung_nsclc_adeno "include"
    type_lung_nsclc_large "include"
    type_lung_nsclc_squamous "include"
    type_lung_sclc "include"
    stage_ii "include"
    stage_iii "include"
    treatment_chemo_systemic "exclude"
    status_relapse nil
    status_refractory nil
    status_newly_diagnosed nil
    marker_egfr_mutation "require_alk_or_egfr"
    marker_kras_mutation nil
    marker_alk_oncogene nil
  end
end
