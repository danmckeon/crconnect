class TrialsController < ApplicationController
  def index
    p "="*100
    p parse_params
    p "="*100

    # @trials = Trial.where(parse_params[:positives]).where.not(parse_params[:negatives])
    # p "#{@trials.length} clinical trials found"
    p "="*100

  end

  private
  def trial_params
    params.permit(:cancerSubType, :cancerStage, :cancerStatus, :geneticMarkers, :chemotherapy, :radiation, :age)
  end

  def parse_params
    query_params = {}

    case trial_params[:cancerSubType]
    when "type_lung_nsclc_adeno"
      query_params[:type_lung_nsclc_adeno] = "include"
    when "type_lung_nsclc_large"
      query_params[:type_lung_nsclc_large] = "include"
    when "type_lung_nsclc_squamous"
      query_params[:type_lung_nsclc_squamous] = "include"
    when "type_lung_sclc"
      query_params[:type_lung_sclc] = "include"
    end

    case trial_params[:cancerStage]
    when "stage_i"
      query_params[:stage_i] = "include"
    when "stage_ii"
      query_params[:stage_ii] = "include"
    when "stage_iii"
      query_params[:stage_iii] = "include"
    when "stage_iv"
      query_params[:stage_iv] = "include"
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
    #
    # case trial_params[:chemotherapy]
    # when "yes"
    #
    # when "no"
    # end

    query_params
  end
end
