class NavBar extends React.Component {
  onClick(e) {
    e.preventDefault();
    this.props.onClick(e)
  }
  render() {
    return (
      <nav className="navbar navbar-default navbar-fixed-top">
        <div className="col-md-6">

          <div>
            <a className="navbar-brand" href="/">
              <img id="top-logo" alt="Brand" src="crc_logo.png"/>
            </a>
          </div>
        </div>
        <div className="col-md-6">
          <div className="nav navbar-nav navbar-right">
            <button type="button" id="search-button" className="btn btn-default navbar-btn" onClick={(e) => this.onClick(e)}>Search for Clinical Trials</button>
          </div>
        </div>
      </nav>

// test html
      // <nav className="navbar navbar-default navbar-fixed-top">
      //   <div className="container-fluid">
      //     <div className="navbar-header">
      //       <a className="navbar-brand" href="#">
      //         <img alt="Brand" src="crc_logo.png"/>
      //       </a>
      //       <ul className="nav navbar-nav navbar-right">
      //         <li><button type="button" className="btn btn-default navbar-btn">Search for Clinical Trials</button></li>
      //       </ul>
      //     </div>
      //   </div>
      // </nav>
    )
  };

};
