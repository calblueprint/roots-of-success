var TeacherHeader = React.createClass({
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
              <li className="nav-link"><a href="javascript:void(0)">Classrooms</a></li>
              <li className="nav-link"><a href="javascript:void(0)">Modules</a></li>
              <li className="nav-link"><a href="javascript:void(0)">Surveys</a></li>
              <li className="nav-link"><Link to="teacher_edit" params={{id: 2}}>Personal</Link></li>
            </ul>
          </div>
          <div className="navigation-tools">
            <a data-method="delete" href="/teachers/sign_out" className="logout">Log Out</a>
          </div>
        </div>
      </header>
    );
  }
});
