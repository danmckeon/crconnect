class App extends React.Component {
  constructor() {
    super();
    this.state = {
      query: null,
    }
  }

  clickHandler(e) {
    this.setState({
      query: null,
    })
  }

  submitHandler(query) {
    this.setState({
      query: query,
    })
  }


  render () {
    return(
      <div className="app">
        {alert("This website is a prototype. It is intended to show information \
pertaining to clinical trials relevant to a particular condition. We have made \
our best effort in compiling this information but cannot guarantee the validity \
of any information found on this site. Users should always consult their doctor \
before acting on any information found on this website.")}
        <NavBar onClick={(e) => this.clickHandler(e)} />
        {(this.state.query) ? <Results query={this.state.query}/> : <Search onSubmit={(query) => this.submitHandler(query)} />}
      </div>
    )
  }
}
