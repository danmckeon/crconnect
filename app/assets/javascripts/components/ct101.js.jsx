class CT101 extends React.Component {
  copyText(activeTab) {
    if(activeTab === "q1"){
                          return "Clinical trials offer the opportunity to receive new cancer treatments that may not be available otherwise. When you participate in a clinical trial for a cancer treatment, you will receive the treatment under study or the best available standard treatment. Unlike clinical studies in other fields, patients in cancer trials only receive a placebo if no standard treatment already exists. Cancer is one of the most active areas in medical research today. At any time, thousands of clinical trials are underway on new cancer drugs and treatments. There may be multiple trials available nearby."
    } else if(activeTab === "q2"){
                                  return "Patients in cancer clinical trials receive increased monitoring and attention from nurses and doctors due to being in the trial.  Other benefits to participating in a cancer clinical trial include: 1) You may receive access to cutting edge treatments that aren’t available anywhere else. 2) It offers another option if your cancer has become resistant to treatment or has reoccurred. 3) You can help further medical research not only for yourself but for other cancer patients as well."
    } else if(activeTab === "q3") {
                                  return "All medical treatments carry risks, even those that have been used by thousands of patients. Not all treatments prove to be better than the standard of care and may produce additional side effects. However, all clinical trials must meet rigorous guidelines designed to protect patients. You will be monitored very closely during the study for side effects or problems. The health care professional involved in the study will explain any known or anticipated risks to you before you commit to the trial. This is part of the informed consent process."
    } else if(activeTab === "q4") {
                                  return "Informed consent is your right as a clinical trial participant. You must be provided with an outline of the purpose of the study, the exact treatment you will receive, all possible side effects. In addition, it is your right to withdraw at any point, even after granting consent. Signing the informed consent form acknowledges that the trial was explained this to you and that you understand it."
    } else if(activeTab === "q5") {
                                  return "You can use our search tool (below) to find clinical trials that you could be eligible for. If you find one you are interested in participating in, consult your doctor to see if it is a good fit for you."
    }
  }

  headerText(activeTab) {
    if(activeTab === "q1"){
      return "Are clinical trials right for me?"
    } else if(activeTab === "q2"){
      return "Why participate in a clinical trial?"
    } else if(activeTab === "q3"){
      return "Are clinical trials safe?"
    } else if(activeTab === "q4"){
      return "What is informed consent?"
    } else if(activeTab === "q5"){
      return "How do I participate in a clinical trial?"
    }
  }

  render () {
    const Panel = ReactBootstrap.Panel
    const Container = ReactBootstrap.Container;
    const Tab = ReactBootstrap.Tab;
    const Col = ReactBootstrap.Col;
    const Row = ReactBootstrap.Row;
    const Nav = ReactBootstrap.Nav;
    const NavItem = ReactBootstrap.NavItem;
    const Content = ReactBootstrap.Content;
    const Pane = ReactBootstrap.Pane;
    const panelTitle = (
      <h3>Clinical Trials 101</h3>
    );
    return(
      <div className="row">
        <div className="col-sm-1"/>
        <Col sm={10}>
          <Panel header={panelTitle}>
            <Tab.Container id="left-tabs-example" defaultActiveKey="first">
              <Row className="clearfix">
                <Col sm={4}>
                  <Nav bsStyle="pills" stacked>
                    <NavItem eventKey="first" className="ct-question">
                      {this.headerText("q1")}
                    </NavItem>
                    <NavItem eventKey="second" className="ct-question">
                      {this.headerText("q2")}
                    </NavItem>
                    <NavItem eventKey="third" className="ct-question">
                      {this.headerText("q3")}
                    </NavItem>
                    <NavItem eventKey="fourth" className="ct-question">
                      {this.headerText("q4")}
                    </NavItem>
                    <NavItem eventKey="fifth" className="ct-question">
                      {this.headerText("q5")}
                    </NavItem>
                  </Nav>
                </Col>
                <Col sm={8}>
                  <Tab.Content animation>
                    <Tab.Pane eventKey="first">
                      {this.copyText("q1")}
                    </Tab.Pane>
                    <Tab.Pane eventKey="second">
                      {this.copyText("q2")}
                    </Tab.Pane>
                    <Tab.Pane eventKey="third">
                      {this.copyText("q3")}
                    </Tab.Pane>
                    <Tab.Pane eventKey="fourth">
                      {this.copyText("q4")}
                    </Tab.Pane>
                    <Tab.Pane eventKey="fifth">
                      {this.copyText("q5")}
                    </Tab.Pane>
                  </Tab.Content>
                </Col>
              </Row>
            </Tab.Container>
          </Panel>
          </Col>
          <div className="col-sm-1"/>
        </div>
    )
  }
}
