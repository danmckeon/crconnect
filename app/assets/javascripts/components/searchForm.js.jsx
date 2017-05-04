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
          <div className="panel panel-default panel-search-form">
            <div id="jumpsearch"/>
            <div className="panel-heading search-form-heading">
              <div id="new-search"/>
              <h3 className="panel-title">
                Search for Clinical Trials
              </h3>
            </div>
            <div className="panel-body search-form-body">
              <Errors errors={this.state.errors} />
              <form className="search-form form-group" onSubmit={(e) => this.onSubmit(e)}>
                <div className="row">
                  <label htmlFor="cancerType">Cancer Type</label>
                  <select name="cancerType" className="form-control">
                    <option value="Blank">(Please select type)</option>
                    <option disabled="disabled" value="Lung&nbsp;Cancer">---------------------Lung---------------------</option>
                    <option value="Non-Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer&nbsp;(Adenocarcinoma)">Non-Small Cell Lung Cancer (Adenocarcinoma)</option>
                    <option value="Non-Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer&nbsp;(Large&nbsp;Cell)">Non-Small Cell Lung Cancer (Large Cell)</option>
                    <option value="Non-Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer&nbsp;(Squamous)">Non-Small Cell Lung Cancer (Squamous)</option>
                    <option value="Small&nbsp;Cell&nbsp;Lung&nbsp;Cancer">Small Cell Lung Cancer</option>
                    <option disabled="disabled" value="Colorectal&nbsp;Cancer">-------------------Colorectal------------------</option>
                    <option value="Colorectal&nbsp;Cancer&nbsp;(Adenocarcinoma)">Colorectal Cancer (Adenocarcinoma)</option>
                    <option value="Colorectal&nbsp;Cancer&nbsp;(Other&nbsp;types)">Colorectal Cancer (Other types)</option>
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
                  <label htmlFor="cancerStatus">If you have received treatment, what is the current status of your condition?</label>
                  <select name="cancerStatus" className="form-control">
                    <option>(Please select an option)</option>
                    <option value="Never&nbsp;Received&nbsp;Treatment">Never Received Treatment</option>
                    <option value="Relapsed">Relapsed</option>
                    <option value="Refractory">Refractory</option>
                  </select>
                  {/* Note: Consider checkbox input for genetic markers, and check controller logic. */}
                  <label htmlFor="geneticMarkers">Select a relevant genetic marker you possess (leave blank if you aren't sure)</label>
                  <select name="geneticMarkers" className="form-control">
                    <option>(Please select an option)</option>
                    <option value="None">None</option>
                    <option value="ALK&nbsp;Oncogene">ALK Oncogene</option>
                    <option value="EGFR&nbsp;Mutation">EGFR Mutation</option>
                    <option value="KRAS&nbsp;Mutation">KRAS Mutation</option>
                  </select>
                  <label htmlFor="age">Age</label>
                  <input type="text" name="age" className="form-control" />
                  <label htmlFor="zipcode">Zipcode</label>
                  <input type="text" name="zipcode" className="form-control" />
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
