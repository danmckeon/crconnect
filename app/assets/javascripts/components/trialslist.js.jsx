class TrialsList extends React.Component {
  render () {
    return(
      <div>
        <h2>This is where the Trials List will render Trial components header goes </h2>
        <Trial proof={this.props.example} />
      </div>
    )
  }
}
