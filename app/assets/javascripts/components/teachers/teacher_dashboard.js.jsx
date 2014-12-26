var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <TeacherHeader/>
        <div className="spacer"></div>
        <RouteHandler/>
      </div>
    );
  }
});
