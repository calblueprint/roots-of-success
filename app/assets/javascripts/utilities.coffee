window.ready = (funcs...) ->
  funcs.forEach (func) ->
    $(document).ready func
    $(document).on "page:load", func
