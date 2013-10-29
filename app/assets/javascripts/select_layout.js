$(document).ready(function($) {
  var selected = $('.layouts span').data('value');
  var img_name = $('.layouts img').each(function(index){
    if($(this).attr('id') == selected){
      $(this).addClass('selected_layout');
    }
  });
});
$(function(){
  $('.layouts span').change(function(){
    var selected = $(this).text();
    //console.log("selected : "+selected);
    var img_name = $.map($(this).data('collection'),
      function(val){
        if(val[1] == selected){
          //console.log('find');
          return val[0];
        }
      });
    $('.layouts img').removeClass('selected_layout');
    $('.layouts img#'+img_name).addClass('selected_layout');
  });
});

$(function(){
  $('.layouts img').click(function(){
    console.log($(this));

  });
});
