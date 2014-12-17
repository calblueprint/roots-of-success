var Header = React.createClass({
  // TODO: Make this more declarative
  slideToggleList: function() {
    $('#js-navigation-menu').slideToggle(function(){
      if ($('#js-navigation-menu').is(':hidden')) {
        $('#js-navigation-menu').removeAttr('style');
      }
    });
  },

  render: function() {
    // TODO: Need the actual header links
    return (
      <header className="navigation">
        <div className="navigation-wrapper">
          <a href="javascript:void(0)" className="logo">
            <img src="/assets/RoSLogo.svg" alt="Logo Image"/>
          </a>
          <a href="javascript:void(0)" className="navigation-menu-button" id="js-mobile-menu"
             onClick={this.slideToggleList}>MENU</a>
          <div className="nav">
            <ul id="js-navigation-menu" className="navigation-menu">
              <li className="nav-link"><a href="javascript:void(0)">Products</a></li>
              <li className="nav-link"><a href="javascript:void(0)">About Us</a></li>
              <li className="nav-link"><a href="javascript:void(0)">Contact</a></li>
            </ul>
          </div>
          <div className="navigation-tools">
            <a href="javascript:void(0)" className="sign-up">Sign Up</a>
          </div>
        </div>
      </header>
    );
  }
});
