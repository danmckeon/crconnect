class SearchForm extends React.Component {
  constructor() {
    super();
    this.state = {
      errors: {},
    }
  }


  jsonifyQueryString(queryString){
    let pairs = queryString.split('&');
    let result = {};
    pairs.forEach(function(pair) {
      pair = pair.split('=');
      result[pair[0]] = decodeURIComponent(pair[1] || '');
    });
    return result;
  }

  prettifyCamel(camelCaseString){
    return camelCaseString.replace(/([A-Z])/g, ' $1')
    .replace(/^./, (str) => { return str.toUpperCase(); })
  }

  checkAgeError(errors, query) {
    if ( !(query.age > 1 && query.age<150) ) {
      errors['AgeError'] = 'Please enter a number between 1 and 150 for age';
    }
    return errors;
  }

  checkDropdownError(errors, query) {
    for (let field in query) {
      if (query[field] === "Blank") {
        errors[field + 'Error'] = `Please select an option for ${this.prettifyCamel(field)}`;
      };
    };
    return errors;
  }

  validateInput(query) {
    let errors = {};
    errors = this.checkDropdownError(errors, query);
    errors = this.checkAgeError(errors, query);
    this.setState({
      errors: errors,
    })
    if ($.isEmptyObject(errors)) {
      return true;
    }
    return false;
  }

  onSubmit(e) {
    e.preventDefault();
    let queryString = $(e.target).serialize();
    let query = this.jsonifyQueryString(queryString);
    if (this.validateInput(query)) {
      this.props.onSubmit(query);
    } else {
      return;
    };

  }

  render() {
    return (
      <div className="row">
        <div className="col-sm-1">
        </div>
        <div className="search-form-container col-sm-10">
          <div className="panel panel-default">
            <div id="jumpsearch"/>
            <div className="panel-heading">
              <div id="new-search"/>
              <h3 className="panel-title">
                Search for Clinial Trials
              </h3>
            </div>
            <div className="panel-body search-form-body">
              <Errors errors={this.state.errors} />
              <form className="search-form form-group" onSubmit={(e) => this.onSubmit(e)}>
                <div className="row">
                  <label htmlFor="cancerType">Cancer Type</label>
                  <select name="cancerType" className="form-control">
                    <option value="Blank">(Please select type)</option>
                    <option value="Lung&nbsp;Cancer">Lung Cancer</option>
                  </select>
                  <label htmlFor="cancerSubType">Sub-Type</label>
                  <select name="cancerSubType" className="form-control">
                    <option value="Blank">(Please select sub-type)</option>
                    <option value="Non-Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer&nbsp;(Adenocarcinoma)">Non-Small Cell Lung Cancer (Adenocarcinoma)</option>
                    <option value="Non-Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer&nbsp;(Large&nbsp;Cell)">Non-Small Cell Lung Cancer (Large Cell)</option>
                    <option value="Non-Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer&nbsp;(Squamous)">Non-Small Cell Lung Cancer (Squamous)</option>
                    <option value="Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer">Small Cell Lung Cancer</option>
                  </select>
                  <label htmlFor="cancerStage">Stage</label>
                  <select name="cancerStage" className="form-control">
                    <option value="Blank">(Please select stage)</option>
                    <option value="Stage&nbsp;I">Stage I</option>
                    <option value="Stage&nbsp;II">Stage II</option>
                    <option value="Stage&nbsp;III">Stage III</option>
                    <option value="Stage&nbsp;IV">Stage IV</option>
                  </select>
                  <label htmlFor="chemotherapy">Is chemotherapy your main form of treatment?</label>
                  <select name="chemotherapy" className="form-control">
                    <option value="Blank">(Please select yes or no)</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                  </select>
                  <label htmlFor="radiation">Have you received radiation as a treatment?</label>
                  <select name="radiation" className="form-control">
                    <option value="Blank">(Please select yes or no)</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                  </select>
                  <label htmlFor="cancerStatus">If you have received treatment, what was the outcome?</label>
                  <select name="cancerStatus" className="form-control">
                    <option value="Blank">(Please select an option)</option>
                    <option value="Newly&nbsp;Diagnosed">Never Received Treatment</option>
                    <option value="Relapse">Relapse</option>
                    <option value="Refractory">Refractory</option>
                  </select>
                  {/* <label htmlFor="geneticMarkers">Genetic Markers</label>
                  <select name="geneticMarkers" className="form-control">
                    <option value="none"></option>
                    <option value="marker_alk_oncogene">ALK Oncogene</option>
                    <option value="marker_egfr_mutation">EGFR Mutation</option>
                    <option value="marker_kras_mutation">KRAS Mutation</option>
                  </select> */}
                  <label htmlFor="age">Age</label>
                  <input type="text" name="age" className="form-control" />
                  <input type="submit" id="search-query-submit" className="form-control" value="Find Trials" />
                </div>
              </form>
            </div>
          </div>
        </div>
        <div className="col-sm-1">
        </div>
      </div>
    )
  };
};
