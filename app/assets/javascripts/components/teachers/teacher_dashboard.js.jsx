var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <TeacherHeader currentTeacherId={this.props.currentTeacherId}/>
        <div className="spacer-small"></div>
        <RouteHandler currentTeacherId={this.props.currentTeacherId}
                      currentTeacher={this.props.currentTeacher}/>
      </div>
    );
  }
});
