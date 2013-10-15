# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.best_in_place').best_in_place()
  $('.subimages img').click ->
  	$src = $(this).attr("src")
  	$('.image img').attr("src",$src).fadeIn
$('#new_project').modal()
