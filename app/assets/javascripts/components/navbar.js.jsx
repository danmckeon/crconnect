class NavBar extends React.Component {
  onClick(e) {
    e.preventDefault();
    this.props.onClick(e)
  }
  render() {
    return (
      <nav className="navbar navbar-default navbar-fixed-top navi">
            <a href="/">
              <img id="top-logo" alt="Brand" src="crc_logo.png" className="img-responsive"/>
            </a>
            <button type="button" id="search-button" className="btn btn-default navbar-btn" onClick={(e) => this.onClick(e)}>Search for<br></br> Clinical Trials</button>
      </nav>
    )
  };

};
