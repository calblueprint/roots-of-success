var TeacherDashboard = React.createClass({
  render: function() {
    return (
      <div>
        <TeacherHeader currentTeacherId={this.props.currentTeacherId}/>
        <div className="spacer-small"></div>
        <div className="row">
          <div className="small-12 columns">
            <RouteHandler currentTeacherId={this.props.currentTeacherId}
                          currentTeacher={this.props.currentTeacher}/>
          </div>
        </div>
      </div>
    );
  }
});
