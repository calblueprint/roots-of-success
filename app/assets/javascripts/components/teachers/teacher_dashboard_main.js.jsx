var TeacherDashboardMain = React.createClass({
  mixins: [Router.State, Router.Navigation],

  classroomsUrl: function classroomsUrl() {
    return "/api/teachers/" + this.props.currentTeacherId + "/classrooms";
  },

  getInitialState: function getInitialState() {
    return { classrooms: [] };
  },
  componentDidMount: function componentDidMount() {
    $.ajax({
      url: this.classroomsUrl(),
      dataType: "json",
      success: function getSuccess(classroomsData) {
        this.setState(classroomsData);
      }.bind(this),
      error: serverError
    });
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
