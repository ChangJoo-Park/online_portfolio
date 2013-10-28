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
    $('.layouts img').attr('src',"/assets/"+img_name+".png");
  });
});
