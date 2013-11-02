# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".projects_items .item h1 a").click (event) ->
    event.preventDefault()
    console.log $(this)
    number = $(this).attr('class').replace(/[^0-9.]/g, "")
    console.log("no_"+number)
    scrollTo("no_"+number)
    $(".sub_"+number).slideToggle "fast","easeOutCubic", ->
      console.log "worked"

scrollTo = (id) ->
  id = "."+id
  console.log id
  # Scroll
  offset = $(id).offset().top
  console.log offset
  $("html,body").animate({scrollTop: offset }, "fast")
