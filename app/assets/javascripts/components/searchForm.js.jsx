class SearchForm extends React.Component {
  render() {
    return (
      <div className="row">
        <div className="col-md-3">
        </div>
        <div className="search-form-container col-md-6">
          <form className="search-form form-group">
            <div className="row">
              <label htmlFor="cancerType">Cancer Type</label>
              <select name="cancerType" className="form-control">
                <option value="lung">Lung Cancer</option>
              </select>
              <label htmlFor="cancerSubType">Sub-Type</label>
              <select name="cancerSubType" className="form-control">
                <option value="type_lung_nsclc_adeno">Non-Small Cell Lung Cancer (Adenocarcinoma)</option>
                <option value="type_lung_nsclc_large">Non-Small Cell Lung Cancer (Large Cell)</option>
                <option value="type_lung_nsclc_squamous">Non-Small Cell Lung Cancer (Squamous)</option>
                <option value="type_lung_sclc">Small Cell Lung Cancer</option>
              </select>
              <label htmlFor="cancerStage">Stage</label>
              <select name="cancerStage" className="form-control">
                <option value="stage_i">Stage I</option>
                <option value="stage_ii">Stage II</option>
                <option value="stage_iii">Stage III</option>
                <option value="stage_iv">Stage IV</option>
              </select>
              <label htmlFor="cancerStatus">Status</label>
              <select name="cancerStatus" className="form-control">
                <option value="status_newly_diagnosed">Newly Diagnosed</option>
                <option value="status_relapse">Relapse</option>
                <option value="status_refractory">Refractory</option>
              </select>
              <label htmlFor="geneticMarkers">Genetic Markers</label>
              <select name="geneticMarkers" className="form-control">
                <option value="none"></option>
                <option value="marker_alk_oncogene">ALK Oncogene</option>
                <option value="marker_egfr_mutation">EGFR Mutation</option>
                <option value="marker_kras_mutation">KRAS Mutation</option>
              </select>
              <label htmlFor="chemotherapy">Chemotherapy Treatment Administered</label>
              <select name="chemotherapy" className="form-control">
                <option value="yes">Yes</option>
                <option value="no">No</option>
              </select>
              <label htmlFor="radiation">Radiation Treatment Administered</label>
              <select name="radiation" className="form-control">
                <option value="yes">Yes</option>
                <option value="no">No</option>
              </select>
              <label htmlFor="age">Age</label>
              <input type="text" name="age" className="form-control" />
              <input type="submit" id="search-query-submit" className="form-control" />
            </div>
          </form>
        </div>
        <div className="col-md-3">
        </div>
      </div>
    )
  };
};
