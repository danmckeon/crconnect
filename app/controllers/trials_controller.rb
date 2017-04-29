class TrialsController < ApplicationController
  def index
    p params
    p trial_params
    @trial = Trial.where(type_lung_nsclc_adeno: "include")
  end

  private
  def trial_params
    params.permit(:cancerSubtype, :cancerStage, :cancerStatus, :geneticMarkers, :chemotherapy, :radiation, :age)
  end

  def parse_params
    query_params = {}
    return query_params[:"type_lung_nsclc_adeno"] = "include" if trial_params[:cancerSubtype] == "type_lung_nsclc_adeno"
    
    # add logic here for turning trial params into what needs to be passed in a .where in ActiveRecord
  end
end
