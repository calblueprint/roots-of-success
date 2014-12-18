var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <Header/>
        <div className="spacer"></div>
        <div className="row">
          <div className="small-12 columns">
            <div className="center card">
              <div className="row">
                <div className="medium-8 medium-offset-2 columns">
                  <h2>Welcome to the dashboard!</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
});
