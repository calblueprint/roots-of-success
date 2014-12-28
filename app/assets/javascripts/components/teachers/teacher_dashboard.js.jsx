var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <TeacherHeader/>
        <div className="spacer-small"></div>
        <RouteHandler/>
      </div>
    );
  }
});
