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
    window.location = '/#new-search'
  }

  submitHandler(query) {
    this.setState({
      query: query,
    })
  }

  handleZipError(zipError) {
    this.setState({
      query: null,
    })
    alert(zipError.zipError)
  }


  render () {
    return(
      <div className="app">
        <NavBar onClick={(e) => this.clickHandler(e)} />
        {(this.state.query) ? <Results query={this.state.query} zipHandler={(zipError) => this.handleZipError(zipError)}/> : <Search onSubmit={(query) => this.submitHandler(query)} />}
        <Footer />
      </div>
    )
  }
}
