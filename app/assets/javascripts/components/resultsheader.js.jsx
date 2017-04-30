class ResultsHeader extends React.Component {
  render () {
    return(
      <div>
        <h2>This is where the Results header goes </h2>
        <p>{JSON.stringify(this.props.query)}</p>
      </div>
    )
  }
}
