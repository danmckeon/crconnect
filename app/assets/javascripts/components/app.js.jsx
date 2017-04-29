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
        <Search />
      </div>
    )
  }
}
