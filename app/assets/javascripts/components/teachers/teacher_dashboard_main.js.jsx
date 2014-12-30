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
          <Card>
            <h2>Welcome to the dashboard!</h2>
          </Card>
        </div>
      </div>
    );
  }
});
