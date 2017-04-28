class NavBar extends React.Component {

  render() {
    return (
      <nav className="navbar navbar-default navbar-fixed-top">
        <div className="container-fluid">

          <div className="navbar-header">
            <button type="button" className="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span className="sr-only">Toggle navigation</span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
              <span className="icon-bar"></span>
            </button>
            <a className="navbar-brand" href="/">CRConnect</a>
          </div>

          <div className="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul className="nav navbar-nav navbar-right">
              <li><button type="button" className="btn btn-default navbar-btn">Search for Clinical Trials</button></li>
              <li className="dropdown">
                <a href="#" className="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Links <span className="caret"></span></a>
                <ul className="dropdown-menu">
                  <li><a href="/">Our Mission</a></li>
                  <li><a href="/">The FDA Process</a></li>
                  <li><a href="/">FAQ</a></li>
                  <li role="separator" className="divider"></li>
                  <li><a href="/">Search for Clinical Trials</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    )
  };

};
