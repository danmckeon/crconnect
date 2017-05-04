class App extends React.Component {
  constructor() {
    super();
    this.state = {
      query: null,
      zipError: null,
    }
  }

  clickHandler(e) {
    this.setState({
      query: null,
    })
    window.location = '/#new-search'
  }

  submitHandler(query) {
    this.setState({
      zipError: null,
      query: query,
    })
  }

  handleZipError(response) {
    this.setState({
      query: null,
      zipError: response,
    })
  }


  render () {
    return(
      <div className="app">
        <NavBar onClick={(e) => this.clickHandler(e)} />
        {(this.state.query) ? <Results query={this.state.query} zipHandler={(response) => this.handleZipError(response)}/> : <Search zipError={this.state.zipError} onSubmit={(query) => this.submitHandler(query)} />}
        <Footer />
      </div>
    )
  }
}
