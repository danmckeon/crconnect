class Trial extends React.Component {
  constructor() {
    super()
    this._toggleDiv = this._toggleDiv.bind(this)
  }

  _toggleDiv() {
    $(`#${this.props.trialSite.trial.id}`).slideToggle()
  }

  checkContact(site) {

    if (site.contact_name) {
      return (
        <li className="trial-details-bullets">
          Contact Info: <br/>
            {site.contact_name} <br/>
            {site.contact_phone} <br />
            {site.contact_email}
        </li>
      )
    }
  }

  render() {
    const studyId = this.props.trialSite.trial.id;
    const recruitingStatus = this.props.trialSite.trial.overall_status;;
    const trial = this.props.trialSite.trial;
    const site = this.props.trialSite.site;
    const distance = this.props.trialSite.distance;
    const truncatedTitle = trial.brief_title.substring(0, 100) + '...'

    return (
      <td className="trial-data">
        <div onClick={this._toggleDiv} className="trial-buttons" >
          <a><strong>Location:</strong> {site.name}<br /><br />
          <strong>Trial:</strong> {truncatedTitle} </a>
        </div>
        <div className="trial-details" id={studyId}>
          <ul className="trial-details-list">
            <li className="trial-details-bullets">
              Currently {site.status}
            </li>
            <li className="trial-details-bullets">
              Closest Clinical Trial Site ({distance.toFixed(2)} miles away): <br />
              {site.name} <br />
              {site.city}, {site.state} {site.zip}
            </li>

            {this.checkContact(site)}
            <li className="trial-details-bullets">
              <a href={`https://clinicaltrials.gov/ct2/show/${this.props.trialSite.trial.nct_id}`} target="_blank">More info</a>
            </li>
          </ul>
        </div>
      </td>
    )
  }
}
