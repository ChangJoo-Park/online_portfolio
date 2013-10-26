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
