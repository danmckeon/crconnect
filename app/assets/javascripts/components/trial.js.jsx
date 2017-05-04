class Trial extends React.Component {
  constructor() {
    super()
    this._toggleDiv = this._toggleDiv.bind(this)
  }

  _toggleDiv() {
    $(`#${this.props.trialSite.trial.id}`).slideToggle()
  }

  checkContact() {
    const contactName = this.props.trialSite.trial.overall_contact_name;
    const contactPhone = this.props.trialSite.trial.overall_contact_phone;
    const contactEmail = this.props.trialSite.trial.overall_contact_email;

    if (contactName !== "") {
      return (
        <li>
          Contact info: <br/>
            {contactName} <br/>
            {contactPhone}  {contactEmail}
        </li>
      )
    }
  }

  render() {
    const briefTitle = this.props.trialSite.trial.brief_title;
    const studyId = this.props.trialSite.trial.id;
    const recruitingStatus = this.props.trialSite.trial.overall_status;

    return (
      <td>
        <a onClick={this._toggleDiv} className="trial-buttons" >{briefTitle}</a>
        <div className="trial-details" id={studyId}>
          <ul>
            <li>
              Currently {recruitingStatus}
            </li>
            {this.checkContact()}
            <li>
              <a href={`https://clinicaltrials.gov/ct2/show/${this.props.trialSite.trial.nct_id}`}>More info</a>
            </li>
          </ul>
        </div>
      </td>
    )
  }
}
