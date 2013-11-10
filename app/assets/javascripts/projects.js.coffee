# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Using project detail page, change data with ajax
$ ->
  $('.best_in_place').best_in_place()
# click 'New Project' Button -> Create new project
$ ->
  $("#btn_new_project").bind 'click',(event) =>
    $("#new_project").modal()

$(document).bind 'page:change', ->
  Holder.run()

$ ->
  $('#new_painting').fileupload
    dataType: "script"



ready = ->
  $(".lists a").click (event) ->
    event.preventDefault()
    console.log $(this).data("value")
    if $(this).hasClass("active")
      console.log "has active"
    else
      console.log "not active"
      $(this).parent().find(".active").removeClass "active"
      $(this).addClass("active")
      console.log $("#current_layout")



  a = $(".lists a")
  cl = $('.current_layout').attr("value")
  $.each a, (index, value) ->
    if $(this).attr("value") is cl
      $(this).addClass "active"
  $(".nav-tabs").find('li:first-child').addClass('active')




$(document).ready(ready)
$(document).on('page:load', ready)


$("#myTab a").click (e) ->
  e.preventDefault()
  $(this).tab "show"
