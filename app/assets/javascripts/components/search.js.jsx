class Search extends React.Component {



  onSubmit(query) {
    this.props.onSubmit(query)
  }

  render () {
    return(
      <div className="search-layout container">
        {alert("This website is a prototype. It is intended to show information \
pertaining to clinical trials relevant to a particular condition. We have made \
our best effort in compiling this information but cannot guarantee the validity \
of any information found on this site. Users should always consult their doctor \
before acting on any information found on this website.")}
        <Mission />
        {/* <CT101 />
        <FDAProcess /> */}
        <SearchForm onSubmit={(query) => this.onSubmit(query)}/>
      </div>
    )
  }
}
