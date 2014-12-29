var FormErrors = React.createClass({
  render: function() {
    var classes = cx({
      "errors": true,
      "hidden": $.isEmptyObject(this.props.errors)
    });

    return (
      <div className={classes}>
        { $.map(this.props.errors, function errIterate(errArray, fieldName) {
            return errArray.map(function errDiv(err) {
              return <div>{ fieldName.humanize().capitalize() + " " + err}</div>
            });
          }) }
      </div>
    );
  }
});
