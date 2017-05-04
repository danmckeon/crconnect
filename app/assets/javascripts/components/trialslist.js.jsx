class TrialsList extends React.Component {
  checkQueryResults(queryResults) {
    if (queryResults === null) {
      return (<tr><td>Loading trials...if you wait longer than 30 seconds, please reload page.</td></tr>)
    } else if (queryResults.length === 0){
      return (<tr><td>Your search did not match any trials.</td></tr>)
    } else {
      return (queryResults.map((trialSite) => {return(<tr key={trialSite.trial.id}><Trial trialSite={trialSite} /></tr>)}))
    }
  }
  render () {
    const trials = this.checkQueryResults(this.props.queryResults);

    return(
      <table className="table table-hover table-bordered table-responsive">
        <tbody>
          {trials}
        </tbody>
      </table>
    )
  }
}
