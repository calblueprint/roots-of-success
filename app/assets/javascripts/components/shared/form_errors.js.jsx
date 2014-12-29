var FormErrors = React.createClass({
  render: function() {
    var classes = cx({
      "errors": true,
      "hidden": $.isEmptyObject(this.props.errors)
    });

    return (
      <div className={classes}>
        { $.map(this.props.errors, function errIterate(errArray, fieldName) {
            return errArray.map(function errDiv(err, index) {
              return (
                <div key={fieldName + index}>
                  { fieldName.humanize().capitalize() + " " + err}
                </div>)
            });
          }) }
      </div>
    );
  }
});
