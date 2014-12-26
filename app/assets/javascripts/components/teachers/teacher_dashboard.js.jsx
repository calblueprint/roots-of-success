var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <Header/>
        <div className="spacer"></div>
        <TeacherEdit/>
      </div>
    );
  }
});
