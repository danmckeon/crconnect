class ResultsHeader extends React.Component {
  render () {
    return(
      <div>
        <h3>Showing clinical trials for:</h3>
          <span className="btn btn-default results-header-params">Cancer Type: {this.props.query.cancerType}</span>
          <span className="btn btn-default results-header-params">Sub-type: {this.props.query.cancerSubType}</span>
          <span className="btn btn-default results-header-params">Stage: {this.props.query.cancerStage}</span>
          <span className="btn btn-default results-header-params">Status: {this.props.query.cancerStatus}</span>
          <span className="btn btn-default results-header-params">Genetic Markers: {this.props.query.geneticMarkers}</span>
          <span className="btn btn-default results-header-params">Chemotherapy: {this.props.query.chemotherapy}</span>
          <span className="btn btn-default results-header-params">Radiation: {this.props.query.radiation}</span>
          <span className="btn btn-default results-header-params">Age: {this.props.query.age}</span>
        </div>
    )
  }
}
