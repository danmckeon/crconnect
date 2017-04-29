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
        <NavBar onClick={(e) => this.clickHandler(e)} />
        {(this.state.query) ? <Results /> : <Search onSubmit={(query) => this.submitHandler(query)} />}
      </div>
    )
  }
}
