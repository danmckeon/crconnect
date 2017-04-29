class App extends React.Component {
  constructor() {
    super();
    this.state = {
      mode: "search"
    }
  }
  render () {
    return(
      <div>
        <h1>Test</h1>
        <p>Hey this is some test text. This should work. It better.</p>
        <Mission />
      </div>
    )
  }
}
