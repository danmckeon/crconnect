class CT101 extends React.Component {
  render () {
    return(
      <div className="row">
        <div className="col-sm-3"></div>
      	<div className="col-sm-6">
          <div className="panel panel-default">
            <div className="panel-heading">
              <h3 className="panel-title">
                Clinical Trials 101
              </h3>
            </div>
            <div className="panel-body">
              <Question />
            </div>
          </div>
        </div>
        <div className="col-sm-3"></div>
      </div>
    )
  }
}
