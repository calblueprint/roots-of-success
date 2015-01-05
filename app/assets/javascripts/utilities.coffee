window.ready = (func) ->
  $(document).ready func
  $(document).on "page:load", func
