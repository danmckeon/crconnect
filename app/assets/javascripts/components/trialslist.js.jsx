class TrialsList extends React.Component {
  render () {
    return(
      <table className="table table-hover table-bordered table-responsive">
        <thead>
          <tr>
            <th>Study Title</th>
          </tr>
        </thead>
        <tbody>
          { (this.props.queryResults) ? this.props.queryResults.map((trial) => {return(<tr key={trial.id}><Trial trial={trial} /></tr>)}) : <tr><td>Oops. Something went wrong. Please try again.</td></tr> }
        </tbody>
      </table>
    )
  }
}
