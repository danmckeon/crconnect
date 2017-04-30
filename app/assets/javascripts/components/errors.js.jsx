class Errors extends React.Component {
  render () {
    return(
      <div className="errors">
        <p>{JSON.stringify(this.props.errors)}</p>
      </div>
    )
  }
}
