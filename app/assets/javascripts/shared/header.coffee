headerSlideToggle = ->
  $("#js-navigation-menu").removeClass("show");

  $("#js-mobile-menu").on "click", (e) ->
    e.preventDefault()
    $("#js-navigation-menu").slideToggle ->
      if $("#js-navigation-menu").is(":hidden")
        $("#js-navigation-menu").removeAttr("style")

ready headerSlideToggle
