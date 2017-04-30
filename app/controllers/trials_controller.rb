class TrialsController < ApplicationController
  def index
    trials = Trial.where(parse_params[:positives]).where.not(parse_params[:negatives])
    trials = age_filter(trials, trial_params[:age])
    respond_to do |format|
      format.json { render json: trials }
    end
  end

  private
  def trial_params
    params.permit(:cancerSubType, :cancerStage, :cancerStatus, :geneticMarkers, :chemotherapy, :radiation, :age)
  end

  def parse_params
    query_params = {
      positives: {},
      negatives: {}
    }

    case trial_params[:cancerSubType]
    when "Non-Small Cell Lung Cancer (Adenocarcinoma)"
      query_params[:positives][:type_lung_nsclc_adeno] = "include"
    when "Non-Small Cell Lung Cancer (Large Cell)"
      query_params[:positives][:type_lung_nsclc_large] = "include"
    when "Non-Small Cell Lung Cancer (Squamous)"
      query_params[:positives][:type_lung_nsclc_squamous] = "include"
    when "Small Cell Lung Cancer"
      query_params[:positives][:type_lung_sclc] = "include"
    end

    case trial_params[:cancerStage]
    when "Stage I"
      query_params[:positives][:stage_i] = "include"
    when "Stage II"
      query_params[:positives][:stage_ii] = "include"
    when "Stage III"
      query_params[:positives][:stage_iii] = "include"
    when "Stage IV"
      query_params[:positives][:stage_iv] = "include"
    end

    case trial_params[:chemotherapy]
    when "yes"
      query_params[:negatives][:treatment_chemo_systemic] = "exclude"
    when "no"
      query_params[:negatives][:treatment_chemo_systemic] = "require"
    end

    case trial_params[:radiation]
    when "yes"
      query_params[:negatives][:treatment_radiation] = "exclude"
    when "no"
      query_params[:negatives][:treatment_radiation] = "require"
    end

    # case trial_params[:cancerStatus]
    # when "status_newly_diagnosed"
    #   query_params[:status_newly_diagnosed] = "include"
    # when "status_relapse"
    #   query_params[:negatives[:status_relapse]] = "exclude"
    #   query_params[:negatives[:status_refractory]] = "require"
    #   query_params[:negatives[:status_newly_diagnosed]] = "require"
    # when "status_refractory"
    #   query_params[:status_refractory] = "include"
    # end
    #
    # case trial_params[:geneticMarkers] # RE-DO THIS
    # when "marker_alk_oncogene"
    #   query_params[:marker_alk_oncogene] = "include"
    # when "marker_egfr_mutation"
    #   query_params[:marker_egfr_mutation] = "include"
    # when "marker_kras_mutation"
    #   query_params[:marker_kras_mutation] = "include"
    # end
    query_params
  end

  def age_filter(trials, user_age)
    trials.select do |trial|
      min = trial[:age_min].to_i
      max = trial[:age_max].to_i
      user = user_age.to_i
      min < user && user < max
    end
  end
end
