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
        <li>
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

    return (
      <td>
        <div onClick={this._toggleDiv} className="trial-buttons" >
          <a>Location: {site.name}</a><br />
          <a>Trial: {trial.brief_title.substring(0, 100)}...</a>
        </div>
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
