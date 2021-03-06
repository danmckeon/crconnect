class Search extends React.Component {

  onSubmit(query) {
    this.props.onSubmit(query)
  }

  render () {
    return(
      <div className="search-layout container">
        <Mission />
        <CT101 />
        <FDAProcess />
        <SearchForm zipError = {this.props.zipError} onSubmit={(query) => this.onSubmit(query)}/>
      </div>
    )
  }
}
