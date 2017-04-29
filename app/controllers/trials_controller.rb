class TrialsController < ApplicationController
  def index
    p params
    p trial_params
    @trial = Trial.where(query_params)
  end

  private
  def trial_params
    params.permit(:cancerSubtype, :cancerStage, :cancerStatus, :geneticMarkers, :chemotherapy, :radiation, :age)
  end

  def parse_params
    query_params = {}
    if trial_params[:cancerSubtype] == "type_lung_nsclc_adeno"
      query_params[:"type_lung_nsclc_adeno"] = "include"
    elsif trial_params[:cancerSubtype] == "type_lung_nsclc_large"
      query_params[:"type_lung_nsclc_large"] = "include"
    elsif trial_params[:cancerSubtype] == "type_lung_nsclc_squamous"
      query_params[:"type_lung_nsclc_squamous"] = "include"
    else
      query_params[:"type_lung_sclc"] = "include"
    end

    # add logic here for turning trial params into what needs to be passed in a .where in ActiveRecord
  end
end
