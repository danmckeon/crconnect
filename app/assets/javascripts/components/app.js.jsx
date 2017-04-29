class App extends React.Component {
  constructor() {
    super();
    this.state = {
      query: "",
      mode: "search",
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
        <Search onSubmit={(query) => this.submitHandler(query)} />
        <Results />
      </div>
    )
  }
}
