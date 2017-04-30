class Trial extends React.Component {
  render () {
    return(
        <td>
          <a href={"https://clinicaltrials.gov/ct2/show/" + this.props.trial.nct_id}>{this.props.trial.study_title}</a>
        </td>
    )
  }
}
