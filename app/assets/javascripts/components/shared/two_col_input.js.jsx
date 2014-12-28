var TwoColInput = React.createClass({
  render: function() {
    return (
      <div className="row">
        <div className="medium-6 columns two-col-form-label">
          <h4>{this.props.label}</h4>
        </div>
        <div className="medium-6 columns">
          <input type="text" value={this.props.value} onChange={this.props.valueSetter}/>
        </div>
      </div>
    );
  }
});
