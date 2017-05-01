class NavBar extends React.Component {
  render() {
    return (
      <nav className="navbar navbar-default navbar-fixed-top">
        <div className="col-xs-6 col-sm-6">

          <div>
            <a className="navbar-brand" href="/">
              <img id="top-logo" alt="Brand" src="crc_logo.png"/>
            </a>
          </div>
        </div>
        <div className="col-xs-6 col-sm-6">
          <div className="nav navbar-nav navbar-right">
            <a type="button" id="search-button" className="btn btn-default navbar-btn" href="#jumpsearch">Search for Clinical Trials</a>
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
