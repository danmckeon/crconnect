class Trial extends React.Component {
  render () {
    return(
        <td>
          <a href={"https://clinicaltrials.gov/ct2/show/" + this.props.trial.nct_id}>{this.props.trial.brief_title}</a>
          <div>
            <ul>
              <li>
                <a href={"https://clinicaltrials.gov/ct2/show/" + this.props.trial.nct_id}>More info</a>
              </li>
            </ul>
          </div>
        </td>
    )
  }
}
