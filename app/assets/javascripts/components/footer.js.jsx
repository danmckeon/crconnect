class Footer extends React.Component {
  render() {
    return (
      <footer className="panel-footer">
        <div className="footer-contact-container">
          <span className="footer-contact-text">
            Contact Us: <a href="mailto:info@crconnect.org" target="_top">info@crconnect.org</a>
          </span>
          <span className="footer-contact-separator">|</span>
          <span className="footer-contact-text">
            Find our Project on <a href="https://github.com/danmckeon/crconnect" target="_blank">Github</a>
          </span>
        </div>
        <div className="footer-disclaimer-container row">
          <div className="col-sm-2"></div>
        	<div className="col-sm-8">
            <p>Disclaimer: This website is a prototype. It is intended to show information
            pertaining to clinical trials relevant to a particular condition. We have made
            our best effort in compiling this information but cannot guarantee the validity
            of any information found on this site. Users should always consult their doctor
            before acting on any information found on this website.</p>
          </div>
          <div className="col-sm-2"></div>
        </div>
      </footer>
    )
  };
};
