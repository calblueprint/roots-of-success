# This function enables creation of simple AJAX links.
#
# Create a link like so:
#   a.js-ajax-link [
#     data-url="/foo/bar/confirm"
#   ]
#
# Expects the server to respond with something like:
# { message: "Successfulled foo'd bar." }
#
# This function will set up the a tag to POST to the data-url on click and use
# toastr to display the success message or the failure message from the server.
#
# There's no loading spinner or anything, so hope that the server doesn't take
# too long to respond.
enable_ajax_links = ->
  handleClick = (e) ->
    e.preventDefault

    target = e.delegateTarget
    url = "#{target.dataset.url}.json"

    if (!url)
      throw "[InvariantError]: Missing data-url attribute on ajax link #{target}"

    $.post url
      .done (data) ->
        toastr.success data.message
      .fail (data) ->
        toastr.error data.statusText, "An error occurred :("

  $('.js-ajax-link').click handleClick

ready enable_ajax_links
