var TeacherDashboardMain = React.createClass({
  mixins: [Router.State, Router.Navigation],

  classroomsUrl: function classroomsUrl() {
    return "/api/teachers/" + this.props.currentTeacherId + "/classrooms";
  },

  getInitialState: function getInitialState() {
    return { classrooms: [] };
  },
  componentDidMount: function componentDidMount() {
    getState(this, this.classroomsUrl());
  },

  render: function() {
    return (
      <div>
        <Paper>
          {/* BUG: First name doesn't update on modifying teacher */}
          <h2>Hey {this.props.currentTeacher.first_name}!</h2>
          <div className="subtitle">These are your active classrooms. Teach away!</div>
        </Paper>
        <div className="spacer-small"></div>
        {this.state.classrooms.map(function renderClassroom(classroom, index) {
          return <Classroom key={classroom.id}
                            classroom={classroom}
                            currentTeacherId={this.props.currentTeacherId}/>
        }.bind(this))}
      </div>
    );
  }
});
