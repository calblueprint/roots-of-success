classroomShow = ->
  BUTTON_TYPES = ["students", "modules", "surveys", "settings"]
  CHECKBOXES = BUTTON_TYPES.map (type) ->
    $("input[value='" + type + "']")
  CONTENT_DIVS = BUTTON_TYPES.map (type) ->
    $("#" + type)
  COLLECTION = _.zip(CHECKBOXES, CONTENT_DIVS)

  showIfChecked = ->
    COLLECTION.forEach (inputContentPair) ->
      input = inputContentPair[0]
      content = inputContentPair[1]

      if input.is(":checked")
        content.show()
      else
        content.hide()

  showIfChecked()

  $(".button-group").on "click", "label > input", (event) ->
    this.click()
    showIfChecked()
    # console.log this

ready classroomShow
