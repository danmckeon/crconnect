class Trial extends React.Component {
  constructor() {
    super()
    this._toggleDiv = this._toggleDiv.bind(this)
  }

  _toggleDiv() {
    $(`#${this.props.trial.id}`).slideToggle()
  }

  checkContact() {
    const contactName = this.props.trial.overall_contact_name;
    const contactPhone = this.props.trial.overall_contact_phone;
    const contactEmail = this.props.trial.overall_contact_email;

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
    const briefTitle = this.props.trial.brief_title;
    const studyId = this.props.trial.id;
    const recruitingStatus = this.props.trial.overall_status;

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
              <a href={`https://clinicaltrials.gov/ct2/show/${this.props.trial.nct_id}`}>More info</a>
            </li>
          </ul>
        </div>
      </td>
    )
  }
}
