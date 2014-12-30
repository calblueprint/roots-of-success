var TeacherEdit = React.createClass({
  mixins: [Router.State, Router.Navigation],

  editUrl: function editUrl() {
    return "/api/teachers/" + this.getParams().id + "/edit";
  },
  updateUrl: function updateUrl() {
    return "/api/teachers/" + this.getParams().id;
  },

  getInitialState: function getInitialState() {
    return { errors: {}, updatable_attrs: [] };
  },
  componentDidMount: function componentDidMount() {
    $.get(this.editUrl())
     .done(function editSuccess(teacherData) {
        this.setState(teacherData);
      }.bind(this))
     .fail(serverError(this));
  },
  updateAttributes: function updateAttributes(e) {
    e.preventDefault();
    $.ajax({
      url: this.updateUrl(),
      type: "PUT",
      dataType: "json",
      data: { teacher: pick(this.state, this.state.updatable_attrs) },
      success: function updateSuccess(response) {
        console.log(response);
        this.transitionTo("teacher_dashboard");
        toastr.success("We got your info down. Thanks!");
      }.bind(this),
      error: serverError(this)
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
          <Paper>
            <h2>Tell us about yourself.</h2>
            <div className="spacer"></div>
            <form action="#" onSubmit={this.updateAttributes}>
              <FormErrors errors={this.state.errors}/>
              {this.state.updatable_attrs.map(function attrToInput(attr, index) {
                return <TwoColInput value={this.state[attr]}
                                    label={"My " + attr.humanize()}
                                    key={index}
                                    valueSetter={this.valueSetter(attr)} />
              }.bind(this))}
              <button type="submit" href="javascript:void(0)" className="button">
                Update My Info!
              </button>
            </form>
          </Paper>
        </div>
      </div>
    );
  }
});
