var Classroom = React.createClass({
  mixins: [Router.State, Router.Navigation],

  classroomUrl: function() {
    return "/teachers/" + this.props.currentTeacherId + "/classrooms/" + this.props.classroom.id;
  },

  classroomShow: function classroomShow() {
    this.transitionTo(this.classroomUrl());
  },
  render: function() {
    return (
      <Card key={this.props.classroom.id}>
        <div className="card-image" onClick={this.classroomShow}>
          { /* TODO: Get actual image */ }
          <img src="https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/mountains-3.png" alt=""/>
        </div>
        <div className="card-header" onClick={this.classroomShow}>
          {this.props.classroom.name}
        </div>
        <div className="card-copy" onClick={this.classroomShow}>
          {this.props.classroom.description}
        </div>
        <div className="card-stats" onClick={this.classroomShow}>
          <ul>
            <li>
              <span className="label">2</span>
              <span>Modules Presented</span>
            </li>
            <li>
              <span className="label">No</span>
              <span>Surveys Given</span>
            </li>
          </ul>
        </div>
      </Card>
    );
  }
});
