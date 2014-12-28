// The humanize function takes in a camel case string and outputs
// a human-readable version.
var humanize = function humanize(str) {
  return str.replace(/_/g, ' ')
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
