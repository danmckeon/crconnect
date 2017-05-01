class FDAProcess extends React.Component {
  render () {
    return(
      <div className="row">
        <div className="col-sm-1"/>
        <div className="col-sm-10">
          <div className="panel panel-default">
            <div className="panel-heading">
              <h3 className="panel-title">
                The FDA Process
              </h3>
            </div>
            <div className="panel-body fda-panel-body">
              <div className="col-md-3 panel panel-default fda-panel">
                <div className="panel-body inner-fda-panel">
                  Every new medication begins in the laboratory.  Pharmaceutical companies and other researchers evaluate tens of thousands of compounds every year, searching for the few that may prove beneficial.  From the time they identify such a compound until it reaches the market (if it does) it could take 10 years or more and could cost more than a billion dollars.
                </div>
              </div>
              <div className="col-md-3 panel panel-default fda-panel">
                <div className="panel-body inner-fda-panel">
                  Once a compound shows promise in the laboratory and animal studies, companies apply to the FDA for permission to conduct human clinical trials.  These trials occur in four phases designed to determine specific information, such as risks, safety, and effectiveness compared with a standard drug or therapy.
                </div>
              </div>
              <div className="col-md-3 panel panel-default fda-panel">
                <div className="panel-body inner-fda-panel">
                  Each phase is strictly regulated and evaluated, and the safety of the participants is always the top priority.  If there are any safety concerns, officials will halt the trial.
                </div>
              </div>
              <div className="col-md-3 panel panel-default fda-panel">
                <div className="panel-body inner-fda-panel">
                  Only after a cancer drug has been shown to be safe and effective, or more effective than existing ones, does the FDA approve it for sale in the US.  Once approved, it becomes available for prescription.
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="col-sm-1"/>
      </div>
    )
  }
}
