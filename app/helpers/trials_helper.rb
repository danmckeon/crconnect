module TrialsHelper
  def parse_cancer_type(trial)
    case true
    when trial.type_lung_nsclc_adeno == "include"
      "Non-Small Cell Lung Cancer (Adenocarcinoma)"
    when trial.type_lung_nsclc_large == "include"
      "Non-Small Cell Lung Cancer (Large Cell)"
    when trial.type_lung_nsclc_squamous == "include"
      "Non-Small Cell Lung Cancer (Squamous)"
    when trial.type_lung_sclc == "include"
      "Small Cell Lung Cancer"
    when trial.type_colorectal_adeno == "include"
      "Colorectal Cancer (Adenocarcinoma)"
    when trial.type_colorectal_nonadeno == "include"
      "Colorectal Cancer (Other types)"
    else
      "(Please select type)"
    end
  end

  def parse_cancer_stage(trial)
    case true
    when trial.stage_i == "include"
      "Stage I"
    when trial.stage_ii == "include"
      "Stage II"
    when trial.stage_iii == "include"
      "Stage III"
    when trial.stage_iv == "include"
      "Stage IV"
    else
      "(Please select stage)"
    end
  end
end
