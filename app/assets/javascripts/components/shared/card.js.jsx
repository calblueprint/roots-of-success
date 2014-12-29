var Card = React.createClass({
  render: function() {
    return (
      <div className="center card">
        <div className="row">
          <div className="medium-12 columns">
            {this.props.children}
          </div>
        </div>
      </div>
    );
  }
});
