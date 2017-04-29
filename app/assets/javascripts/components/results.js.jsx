class Results extends React.Component {
  componentWillMount() {
    const queryData = this.props.query
    $.ajax({
      url: "http://localhost:3000/trials/show",
      data: queryData,
    })
  };
  render () {
    return(
      <div>
        <div className="col-sm-1 col-md-3" />
      	<div className="col-sm-10 col-md-6">
          <div className="panel panel-default">
            <div className="panel-heading">
              <ResultsHeader />
              <TrialsList example="Cancer Trial info"/>
            </div>
          </div>
        </div>
        <div className="col-sm-1 col-md-3" />
      </div>
    )
  }
}
