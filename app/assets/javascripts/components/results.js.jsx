class Results extends React.Component {

  constructor() {
    super();
    this.state = {
      trials: null,
    }
  }
  componentWillMount() {
    const queryData = this.props.query;
    $.ajax({
      url: "/trials",
      data: queryData,
    }).done((response) => {
      this.setState({trials: response});
    }).fail((response) => {
      this.props.zipHandler(response.responseJSON)
    });
  };
  render () {
    return(
      <div className="container">
        <div className="row">
          <div className="col-sm-1" />
        	<div className="col-sm-10">
            <div className="panel panel-default">
              <div className="panel-heading">
                <ResultsHeader query={this.props.query}/>
              </div>

              <div className="panel-body">
                <TrialsList queryResults={this.state.trials}/>
              </div>
              
            </div>
          </div>
          <div className="col-sm-1" />
        </div>
      </div>
    )
  }
}
