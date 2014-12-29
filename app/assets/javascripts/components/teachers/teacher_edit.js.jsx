var TeacherEdit = React.createClass({
  mixins: [Router.State, Router.Navigation],

  editUrl: function editUrl() {
    return "/api/teachers/" + this.getParams().id + "/edit";
  },
  updateUrl: function updateUrl() {
    return "/api/teachers/" + this.getParams().id;
  },

  getInitialState: function getInitialState() {
    return { errors: [], updatable_attrs: [] };
  },
  componentDidMount: function componentDidMount() {
    $.ajax({
      url: this.editUrl(),
      dataType: "json",
      success: function editSuccess(teacherData) {
        this.setState(teacherData);
      }.bind(this),
      error: function editError(xhr, status, err) {
        console.error(this.editUrl(), status, err.toString());
        toastr.error("There was an error connecting to the server. Please refresh and try again.");
      }.bind(this)
    });
  },
  updateAttributes: function updateAttributes() {
    $.ajax({
      url: this.updateUrl(),
      type: "PUT",
      dataType: "json",
      data: { teacher: pick(this.state, this.state.updatable_attrs) },
      success: function updateSuccess(response) {
        console.log(response);
        this.transitionTo("teacher_dashboard");
        toastr.success("Info updated!");
      }.bind(this),
      error: function updateError(xhr, status, err) {
        if (xhr.status === 422) {
          console.error(xhr.responseJSON, status, err.toString());
          this.setState({ errors: xhr.responseJSON })
        } else {
          console.error(this.updateUrl(), status, err.toString());
          toastr.error("There was an error connecting to the server. Please refresh and try again.");
        }
      }.bind(this)
    })
  },

  valueSetter: function valueSetter(value) {
    return function(event) {
      var newState = {};
      newState[value] = event.target.value;
      this.setState(newState);
    }.bind(this);
  },
  render: function() {
    return (
      <div className="row">
        <div className="small-12 columns">
          <Card>
            <h2>Tell us about yourself.</h2>
            <pre className="left">
              { JSON.stringify(this.state, undefined, 2) }
            </pre>
            <div className="spacer"></div>
            <FormErrors errors={this.state.errors}/>
            {this.state.updatable_attrs.map(function attrToInput(attr, index) {
              return <TwoColInput value={this.state[attr]}
                                  label={"My " + attr.humanize()}
                                  key={index}
                                  valueSetter={this.valueSetter(attr)} />
            }.bind(this))}
            <a href="javascript:void(0)" onClick={this.updateAttributes} className="button">
              Update My Info!
            </a>
          </Card>
        </div>
      </div>
    );
  }
});
