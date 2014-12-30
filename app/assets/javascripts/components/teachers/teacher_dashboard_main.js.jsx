var TeacherDashboardMain = React.createClass({
  mixins: [Router.State, Router.Navigation],

  classroomsUrl: function classroomsUrl() {
    return "/api/teachers/" + this.props.currentTeacherId + "/classrooms";
  },

  getInitialState: function getInitialState() {
    return { classrooms: [] };
  },
  componentDidMount: function componentDidMount() {
    $.get(this.classroomsUrl())
     .done(stateSetter(this))
     .fail(serverError(this));
  },

  render: function() {
    return (
      <div className="row">
        <div className="small-12 columns">
          <Paper>
            <h2>Hey {this.props.currentTeacher.first_name}!</h2>
            <div class="subtitle">These are your active classrooms. Teach away!</div>
          </Paper>
          <div className="spacer-small"></div>
          <Paper>
            {this.state.classrooms.map(function renderClassroom(classroom) {
              return <Classroom classroom={classroom}/>
            })}
          </Paper>
        </div>
      </div>
    );
  }
});
