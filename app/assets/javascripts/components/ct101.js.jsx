class CT101 extends React.Component {
  constructor() {
    super();
    this.state = {
      activeTab: "q1"
    }
  }

  copyText(activeTab) {
    if(activeTab === "q1"){
                          return "When you participate in a cancer clinical trial, you are guaranteed to receive either the treatment under investigation or the best available standard treatment. Unlike clinical studies in other therapeutic areas, patients in cancer trials receive a sugar pill placebo only if no standard treatment exists. Clinical trials offer you the opportunity to receive new cancer therapies not otherwise available. These therapies represent the most cutting edge thinking among research oncologists. When you volunteer for a cancer clinical trial, clinical trials (sometimes called clinical research studies) evaluate new drugs the U.S. Food and Drug Administration (FDA) hasn’t yet approved or test new uses for already approved drugs. They also evaluate new combinations of existing drugs and treatments, and different dosages of approved drugs, or find the best time to begin using a particular drug or treatment. Cancer is one of the most active areas in medical research today. At any time, thousands of clinical trials are underway on new cancer drugs and treatments. There may be multiple trials available nearby."
    } else if(activeTab === "q2"){
                                  return "Patients in cancer clinical trials also receive increased monitoring and attention from nurses and doctors due to being in the trial.  Other benefits to participating in a cancer clinical trial include: 1) You may receive access to cutting edge treatments that aren’t available anywhere else. 2) It offers another option if your cancer has become resistant to treatment or has reoccurred. 3) You can help further medical research not only for yourself but for other cancer patients as well."
    } else if(activeTab === "q3") {
                                  return "All medical treatments carry risks, even those that have been used by thousands of patients.  Not all treatments prove to be better than the standard of care and may produce additional side effects.  Yet all clinical trials must meet rigorous guidelines designed to protect you.  You will be monitored very closely during the trial for any potential side effects or problems.  Also, the health care professional involved in the study will explain any known or anticipated risks to you before you commit to the trial.  This is part of the informed consent process."
    } else if(activeTab === "q4") {
                                  return "Informed consent is your right as a trial participant.  This document will outline the purpose of the study, the exact treatment you will receive, all possible side effects, and your right to withdraw at any point.  Signing the informed consent form acknowledges that the trial was explained to you and your understand it.  However, you can withdraw from a clinical trial at any time, even after signing the informed consent form."
    } else if(activeTab === "q5") {
                                  return "You can use our search tool (below) to find clinical trials that you could be eligible for. If you find one you are interested in participating in, consult your doctor to see if it is a good fit for you."
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
