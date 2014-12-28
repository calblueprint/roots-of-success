var TeacherEdit = React.createClass({
  mixins: [Router.State],

  editUrl: function editUrl() {
    return "/api/teachers/" + this.getParams().id + "/edit";
  },
  updateUrl: function updateUrl() {
    return "/api/teachers/" + this.getParams().id;
  },

  getInitialState: function getInitialState() {
    return { teacher: {} };
  },
  componentDidMount: function componentDidMount() {
    $.ajax({
      url: this.editUrl(),
      dataType: "json",
      success: function ajaxSuccess(teacherData) {
        this.setState(teacherData);
      }.bind(this),
      error: function ajaxError(xhr, status, err) {
        console.error(editUrl, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div className="row">
        <div className="small-12 columns">
          <Card>
            <h2>Tell us about yourself.</h2>
            <pre className="left">{JSON.stringify(this.state, undefined, 2)}</pre>
            <div className="spacer"></div>
            <div className="row">
              <div className="medium-6 columns two-col-form-label">
                <h4>My first name is:</h4>
              </div>
              <div className="medium-6 columns">
                <input type="text" value={this.state.teacher.first_name}/>
              </div>
            </div>
          </Card>
        </div>
      </div>
    );
  }
});
