# This implements a auto-resizing textarea based on http://stackoverflow.com/a/25621277
#
# By default, applies to all textareas. Set data-no-resize on a textarea tag to
# disable resizing.

resizingTextarea = ->
  $("textarea:not(data-no-resize)").each(->
    @setAttribute "style", "height:#{@scrollHeight}px;overflow-y:hidden;"
  ).on "input", ->
    @style.height = "auto"
    @style.height = "#{@scrollHeight}px"

ready resizingTextarea
