class TrialsList extends React.Component {
  checkQueryResults(queryResults) {
    if (queryResults === null) {
      return (<tr><td>Loading trials...</td></tr>)
    } else if (queryResults.length === 0){
      return (<tr><td>Your search did not match any trials.</td></tr>)
    } else {
      return (queryResults.map((trial) => {return(<tr key={trial.id}><Trial trial={trial} /></tr>)}))
    }
  }
  render () {
    const trials = this.checkQueryResults(this.props.queryResults);

    return(
      <table className="table table-hover table-bordered table-responsive">
        <thead>
          <tr>
            <th>Study Title</th>
          </tr>
        </thead>
        <tbody>
          {trials}
        </tbody>
      </table>
    )
  }
}
