class ResultsHeader extends React.Component {

  checkZipcode() {
    const zipcode = this.props.query.zipcode;
    if(zipcode !== ""){
      return(<span className="btn btn-default results-header-params">{`Zipcode: ${zipcode}`}</span>)
    }
  }
  checkCancerStatus() {
    const cancerStatus = this.props.query.cancerStatus;
    if(cancerStatus !== "(Please+select+an+option)"){
      return(<span className="btn btn-default results-header-params">{`Status: ${cancerStatus}`}</span>)
    }
  }

  checkGeneticMarkers() {
    const geneticMarkers = this.props.query.geneticMarkers;
    if(geneticMarkers !== "(Please+select+an+option)"){
      return(<span className="btn btn-default results-header-params">{`Genetic Markers: ${geneticMarkers}`}</span>)
    }
  }

  render () {
    return(
      <div>
          <span className="btn btn-default results-header-params">Stage: {this.props.query.cancerStage}</span>
          {this.checkCancerStatus()}
          {this.checkGeneticMarkers()}
          <span className="btn btn-default results-header-params">Chemotherapy: {this.props.query.chemotherapy}</span>
          <span className="btn btn-default results-header-params">Radiation: {this.props.query.radiation}</span>
          <span className="btn btn-default results-header-params">Age: {this.props.query.age}</span>
          {this.checkZipcode()}
        </div>
    )
  }
}
