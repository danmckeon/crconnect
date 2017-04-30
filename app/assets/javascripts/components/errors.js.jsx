class Errors extends React.Component {
  render () {
    const errors = Object.keys(this.props.errors).map((field) =>
      <li key={field} className="alert alert-danger">{this.props.errors[field]}</li>
    );
    return(
      <div className="errors">
        <ul>{errors}</ul>
      </div>
    )
  }
}
