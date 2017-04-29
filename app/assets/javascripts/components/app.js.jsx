class App extends React.Component {
  constructor() {
    super();
    this.state = {
      mode: "search",
    }
  }
  render () {
    return(
      <div className="app">
        {/* need to add logic for conditional display */}
        <Search />
        <Results />
      </div>
    )
  }
}
