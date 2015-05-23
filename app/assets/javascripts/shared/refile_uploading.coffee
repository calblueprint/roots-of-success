$(document).on "upload:start", "form", (e) ->
  $(this).find("input[type=submit]").attr 'disabled', true

$(document).on "upload:complete", "form", (e) ->
  unless $(this).find("input.uploading").length
    $(this).find("input[type=submit]").removeAttr "disabled"
