$(function() {

   $('.droppable').droppable({
    accept: ".sortable li",
    tolerance: 'intersect',

    over: function(event,ui){
      $('.project-placeholder').html("<span>Remove This</span>").css("background","red");
      ui.draggable.css("opacity","0.9");
    },

    out: function(event,ui){
      $('.project-placeholder').html("").css("background","#eee");
    },

    drop: function(event,ui){
      var result = confirm("Are you sure?");
      if(result){
        ui.draggable.remove();
        $('.project-placeholder').fadeOut();
        var id = ui.draggable.attr('id').replace('project_','');
        return $.post('/projects/'+id, "_method=delete");
      }else{
        $('.project-placeholder').html("").css("background","#eee");
      }

    }
  });

  $('.sortable').sortable({
    handle: '.handle',
    opacity: 0.8,
    placeholder: 'project-placeholder',
    revert: true,
    connectWith: '.droppable',
    start: function(e, ui){
      //$(ui.placeholder).hide(500);
      //$(".trashcan").show(500);
    },
    stop: function(e, ui){
      //$(ui.placeholder).show(500);
      //(".trashcan").hide(500);
    },
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  }).disableSelection();;

});
