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


$ ->
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

$(document).bind 'page:change', ->
  console.log('page:change')
  a = $(".lists a")
  cl = $('.current_layout').attr("value")
  $.each a, (index, value) ->
    if $(this).attr("value") is cl
      $(this).addClass "active"

$(document).bind 'page:show', ->
  console.log('page:show')
  a = $(".lists a")
  cl = $('.current_layout').attr("value")
  $.each a, (index, value) ->
    if $(this).attr("value") is cl
      $(this).addClass "active"

$(document).ready ->
  console.log('ready')
  a = $(".lists a")
  cl = $('.current_layout').attr("value")
  $.each a, (index, value) ->
    if $(this).attr("value") is cl
      $(this).addClass "active"

