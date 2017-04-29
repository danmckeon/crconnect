class App extends React.Component {
  constructor() {
    super();
    this.state = {
      query: null,
    }
  }

  submitHandler(query) {
    this.setState({
      query: query,
    })
  }

  render () {
    return(
      <div className="app">
        {(this.state.query) ? <Results /> : <Search onSubmit={(query) => this.submitHandler(query)} />}
      </div>
    )
  }
}
