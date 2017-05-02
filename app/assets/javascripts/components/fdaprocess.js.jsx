class FDAProcess extends React.Component {
  render () {
    return(
      <div className="row">
        <div className="col-sm-1" />
        <div className="col-sm-10">
          <div >
          <div className="panel panel-default">
            <div className="panel-heading">
              <h3 className="panel-title">
                The FDA Process
              </h3>
            </div>
            <div className="panel-body fda-panel-body">
              <row className="fda-body-row">
                <div className="panel-icon-container col-sm-12 col-md-3">
                  {/* <span className="glyphicon glyphicon-zoom-in"></span> */}
                  <div className="panel panel-default fda-panel">
                    <div className="panel-body inner-fda-panel">
                      Every new medication begins in the laboratory. Pharmaceutical companies and other researchers evaluate tens of thousands of compounds every year, searching for the ones that prove beneficial to patients. It can take many years and more than a billion dollars to take a new medication from research to production.
                    </div>
                  </div>
                </div>
                <div className="panel-icon-container col-sm-12 col-md-3">
                  {/* <span className="glyphicon glyphicon-zoom-in"></span> */}
                  <div className="panel panel-default fda-panel">
                    <div className="panel-body inner-fda-panel">
                      Once a treatment shows promise in the laboratory and animal studies, companies apply to the FDA for permission to conduct human clinical trials. These trials occur in four phases that are designed to determine specific information, such as risks, safety, and effectiveness compared with a standard drug or therapy.
                    </div>
                  </div>
                </div>
                <div className="panel-icon-container col-sm-12 col-md-3">
                  {/* <span className="glyphicon glyphicon-zoom-in"></span> */}
                  <div className="panel panel-default fda-panel">
                    <div className="panel-body inner-fda-panel">
                      Each phase is strictly regulated and evaluated. Patient safety is a top priority. If there are any safety concerns, officials will halt the trial.
                    </div>
                  </div>
                </div>
                <div className="panel-icon-container col-sm-12 col-md-3">
                  {/* <span className="glyphicon glyphicon-zoom-in"></span> */}
                  <div className="panel panel-default fda-panel">
                    <div className="panel-body inner-fda-panel">
                      The FDA only approves a new cancer drug for sale after it has been shown to be safe and effective -- or more effective than existing treatments. Once approved, it becomes available for prescription. It can take over ten years to reach this point.
                    </div>
                  </div>
                </div>
              </row>
            </div>
          </div>
        </div>
        </div>
        <div className="col-sm-1"/>
    </div>
    )
  }
}
