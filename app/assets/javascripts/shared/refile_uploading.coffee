original_submit_button_text = ""

$(document).on "upload:start", "form", (e) ->
  $input = $(this).find("input[type=submit]")

  original_submit_button_text = $input.val()
  $input.attr "disabled", true
  $input.val("Uploading image...")

$(document).on "upload:complete", "form", (e) ->
  unless $(this).find("input.uploading").length
    $input = $(this).find("input[type=submit]")
    $input.removeAttr "disabled"
    $input.val(original_submit_button_text)
