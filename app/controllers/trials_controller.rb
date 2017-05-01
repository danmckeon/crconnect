class TrialsController < ApplicationController
  def index
    trials = Trial.where(parse_params)
    trials = age_filter(trials, trial_params[:age])
    respond_to do |format|
      format.json { render json: trials }
    end
  end

  private
  def trial_params
    params.permit(:cancerType, :cancerSubType, :cancerStage, :cancerStatus, :geneticMarkers, :chemotherapy, :radiation, :age)
  end

  def parse_params
    query_params = {}

    case trial_params[:cancerSubType]
    when "Non-Small Cell Lung Cancer (Adenocarcinoma)"
      query_params[:type_lung_nsclc_adeno] = "include"
    when "Non-Small Cell Lung Cancer (Large Cell)"
      query_params[:type_lung_nsclc_large] = "include"
    when "Non-Small Cell Lung Cancer (Squamous)"
      query_params[:type_lung_nsclc_squamous] = "include"
    when "Small Cell Lung Cancer"
      query_params[:type_lung_sclc] = "include"
    end

    case trial_params[:cancerStage]
    when "Stage I"
      query_params[:stage_i] = "include"
    when "Stage II"
      query_params[:stage_ii] = "include"
    when "Stage III"
      query_params[:stage_iii] = "include"
    when "Stage IV"
      query_params[:stage_iv] = "include"
    end

    case trial_params[:chemotherapy]
    when "Yes"
      query_params[:treatment_chemo_systemic] = ["require", nil]
    when "No"
      query_params[:treatment_chemo_systemic] = ["exclude", nil]
    end

    case trial_params[:radiation]
    when "Yes"
      query_params[:treatment_radiation] = ["require", nil]
    when "No"
      query_params[:treatment_radiation] = ["exclude", nil]
    end

    case trial_params[:cancerStatus]
    when "Never Received Treatment"
      query_params[:status_newly_diagnosed] = ["require", nil]
    when "Relapsed"
      query_params[:status_relapse] = ["require", nil]
    when "Refractory"
      query_params[:status_refractory] = ["require", nil]
    end

    case trial_params[:geneticMarkers]
    when "None"
      query_params[:marker_alk_oncogene] = ["exclude", nil]
      query_params[:marker_egfr_mutation] = ["exclude", nil]
      query_params[:marker_kras_mutation] = ["exclude", nil]
    when "ALK Oncogene"
      query_params[:marker_alk_oncogene] = ["require", "require_alk_or_egfr", nil]
    when "EGFR Mutation"
      query_params[:marker_egfr_mutation] = ["require", "require_alk_or_egfr", nil]
    when "KRAS Mutation"
      query_params[:marker_kras_mutation] = ["require", nil]
    end
    query_params
  end

  def age_filter(trials, user_age)
    trials.select do |trial|
      min = trial[:age_min].to_i
      max = trial[:age_max].to_i
      user = user_age.to_i
      min <= user && user < max
    end
  end
end
