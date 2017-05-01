class CT101 extends React.Component {
  constructor() {
    super();
    this.state = {
      activeTab: "q2"
    }
  }

  copyText(activeTab) {
    if(activeTab === "q1"){
              return "When you participate in a cancer clinical trial, you are guaranteed to receive either the treatment under investigation or the best available standard treatment. Unlike clinical studies in other therapeutic areas, patients in cancer trials receive a sugar pill placebo only if no standard treatment exists. Clinical trials offer you the opportunity to receive new cancer therapies not otherwise available. These therapies represent the most cutting edge thinking among research oncologists. When you volunteer for a cancer clinical trial, clinical trials (sometimes called clinical research studies) evaluate new drugs the U.S. Food and Drug Administration (FDA) hasn’t yet approved or test new uses for already approved drugs. They also evaluate new combinations of existing drugs and treatments, and different dosages of approved drugs, or find the best time to begin using a particular drug or treatment. Cancer is one of the most active areas in medical research today. At any time, thousands of clinical trials are underway on new cancer drugs and treatments. There may be multiple trials available nearby."
    } else if(activeTab === "q2"){
      return "Patients in cancer clinical trials also receive increased monitoring and attention from nurses and doctors due to being in the trial.  Other benefits to participating in a cancer clinical trial include: \r\n • You may receive access to cutting edge treatments that aren’t available anywhere else.\r\n • It offers another option if your cancer has become resistant to treatment or has reoccurred.\r\n • You can help further medical research not only for yourself but for other cancer patients as well."
    }
  }

  headerText(activeTab) {
    if(activeTab === "q1"){
      return "Are clinical trials right for me?"
    } else if(activeTab === "q2"){
      return "Why participate in a clinical trial?"
    }
  }

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
              <Question display={this.headerText(this.state.activeTab)} />
              <Answer display={this.copyText(this.state.activeTab)} />
            </div>
          </div>
        </div>
        <div className="col-sm-3"></div>
      </div>
    )
  }
}
