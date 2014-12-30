// The humanize function takes in a camel case string and outputs
// a human-readable version.
String.prototype.humanize = function humanize() {
  return this.replace(/_/g, ' ');
}

// Capitalizes first letter in string
String.prototype.capitalize = function capitalize() {
  return this.charAt(0).toUpperCase() + this.slice(1);
}

// Makes a new object with only the pairs where the key is
// in keys from the original object
var pick = function pick(obj, keys) {
  var result = {}, key;
  obj = new Object(obj);
  for (var i = 0, length = keys.length; i < length; i++) {
    key = keys[i];
    if (key in obj) result[key] = obj[key];
  }
  return result;
}

// Takes in a context and returns an error handler for forms
var serverError = function genServerError(context) {
  return function serverError(xhr, status, err) {
    if (xhr.status === 422) {
      console.error(xhr.responseJSON, status, err.toString());
      this.setState({ errors: xhr.responseJSON })
    } else {
      toastr.error("There was an error connecting to the server. Please refresh and try again.");
    }
  }.bind(context);
}

// Takes in a context and a key and returns a function to be passed into .done() that
// runs the equivalent of this.setState({key: data})
var setStateForKey = function setStateForKey(context, key) {
  return function stateSetter(data) {
    newState = {} ; newState[key] = data;
    this.setState(newState);
  }.bind(context);
}
