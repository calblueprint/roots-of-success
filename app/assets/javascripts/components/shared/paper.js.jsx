var Paper = React.createClass({
  render: function() {
    return (
      <div className="center paper">
        <div className="row">
          <div className="medium-12 columns">
            {this.props.children}
          </div>
        </div>
      </div>
    );
  }
});
