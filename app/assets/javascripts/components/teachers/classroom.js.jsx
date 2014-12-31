var Classroom = React.createClass({
  render: function() {
    return (
      <Card>
        <div className="card-image">
          <img src="https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/mountains.png" alt=""/>
        </div>
        <div className="card-header">
          {this.props.classroom.name}
        </div>
        <div className="card-copy">
          {this.props.classroom.description}
        </div>
        <div className="card-stats">
          <ul>
            <li>
              <span className="label">2</span>
              <span>Modules Presented</span>
            </li>
            <li>
              <span className="label">No</span>
              <span>Quiz Given</span>
            </li>
          </ul>
        </div>
      </Card>
    );
  }
});
