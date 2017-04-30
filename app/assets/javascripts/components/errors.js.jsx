class Errors extends React.Component {
  render () {
    const errors = this.props.errors.map((error) =>
      <li key={error}>{error}</li>
    );
    return(
      <div className="errors">
        <ul>{errors}</ul>
      </div>
    )
  }
}
