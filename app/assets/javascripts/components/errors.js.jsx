class Errors extends React.Component {
  render () {
    const errors = Object.keys(this.props.errors).map((field) =>
      <p key={field} className="alert alert-danger">&#8226; {this.props.errors[field]}</p>
    );
    return(
      <div className="errors">{errors}</div>
    )
  }
}
