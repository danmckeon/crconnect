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
        {/* need to add logic for conditional display */}
        <p>{JSON.stringify(this.state.query)}</p>
        <Search onSubmit={(query) => this.submitHandler(query)} />
        <Results />
      </div>
    )
  }
}
