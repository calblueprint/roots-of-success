var Classroom = React.createClass({
  render: function() {
    return (
      <Card>
        <div className="card-header">
          {this.props.name}
        </div>
        <div className="card-copy">
          {this.props.description}
        </div>
        <div className="card-stats">
          <ul>
            <li>2 <span>Modules Presented</span></li>
            <li>No <span>Quiz Given</span></li>
          </ul>
        </div>
      </Card>
    );
  }
});
