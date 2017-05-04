class Trial extends React.Component {
  constructor() {
    super()
    this._toggleDiv = this._toggleDiv.bind(this)
  }

  _toggleDiv() {
    $(`#${this.props.trialSite.trial.id}`).slideToggle()
  }

  checkContact(site) {
    const contactName = this.props.trialSite.trial.overall_contact_name;
    const contactPhone = this.props.trialSite.trial.overall_contact_phone;
    const contactEmail = this.props.trialSite.trial.overall_contact_email;

    if (site.contact_name) {
      return (
        <li>
          Contact Info: <br/>
            {site.contact_name} <br/>
            {site.contact_phone} <br />
            {site. contact_email}
        </li>
      )
    }
  }

  render() {
    const briefTitle = this.props.trialSite.trial.brief_title;
    const studyId = this.props.trialSite.trial.id;
    const recruitingStatus = this.props.trialSite.trial.overall_status;
    const site = this.props.trialSite.site
    const distance = this.props.trialSite.distance

    return (
      <td>
        <a onClick={this._toggleDiv} className="trial-buttons" >{briefTitle}</a>
        <div className="trial-details" id={studyId}>
          <ul>
            <li>
              Currently {site.status}
            </li>
            <li>
              Closest Clinical Trial Site ({distance.toFixed(2)} miles away): <br />
              {site.name} <br />
              {site.city}, {site.state} {site.zip}
            </li>

            {this.checkContact(site)}
            <li>
              <a href={`https://clinicaltrials.gov/ct2/show/${this.props.trialSite.trial.nct_id}`}>More info</a>
            </li>
          </ul>
        </div>
      </td>
    )
  }
}
