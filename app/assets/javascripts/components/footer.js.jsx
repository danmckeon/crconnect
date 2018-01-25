class Footer extends React.Component {
  render() {
    return (
      <footer className="panel-footer">
        <div className="footer-contact-container">
          <span className="footer-contact-text">
            Contact Us:{' '}
            <a href="mailto:cancerresearchconnect@gmail.com" target="_top">
              cancerresearchconnect@gmail.com
            </a>
          </span>
          <span className="footer-contact-separator">|</span>
          <span className="footer-contact-text">
            Find our Project on{' '}
            <a href="https://github.com/danmckeon/crconnect" target="_blank">
              Github
            </a>
          </span>
        </div>
        <div className="footer-disclaimer-container row">
          <div className="col-sm-2" />
          <div className="col-sm-8">
            <p>
              Disclaimer: This website is a prototype. It is intended to show information pertaining
              to clinical trials relevant to a particular condition. We have made our best effort in
              compiling this information but cannot guarantee the validity of any information found
              on this site. Users should always consult their doctor before acting on any
              information found on this website.
            </p>
            <div>
              Pills icon made by{' '}
              <a href="http://www.flaticon.com/authors/sean-mccormick" title="Sean McCormick">
                Sean McCormick
              </a>{' '}
              from{' '}
              <a href="http://www.flaticon.com" title="Flaticon">
                www.flaticon.com
              </a>{' '}
              is licensed by{' '}
              <a
                href="http://creativecommons.org/licenses/by/3.0/"
                title="Creative Commons BY 3.0"
                target="_blank"
              >
                CC 3.0 BY
              </a>
            </div>
            <div>
              Other icons made by{' '}
              <a href="http://www.freepik.com" title="Freepik">
                Freepik
              </a>{' '}
              from{' '}
              <a href="http://www.flaticon.com" title="Flaticon">
                www.flaticon.com
              </a>{' '}
              is licensed by{' '}
              <a
                href="http://creativecommons.org/licenses/by/3.0/"
                title="Creative Commons BY 3.0"
                target="_blank"
              >
                CC 3.0 BY
              </a>
            </div>
          </div>
          <div className="col-sm-2" />
        </div>
      </footer>
    );
  }
}
