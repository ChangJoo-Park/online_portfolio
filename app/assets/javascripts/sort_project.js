$(function() {

   $('.droppable').droppable({
    accept: ".sortable li",
    tolerance: 'pointer',
    over: function(event,ui){
      $('.project-placeholder').html("<span>Remove This</span>").css("background","#eee");
      //$('.trashcan').css("background","red");
      ui.draggable.css("opacity","0.9");
    },

    out: function(event,ui){
      $('.project-placeholder').html("").css("background","#eee");
      //$('.trashcan').css("background","#eee");
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
      $(".trashcan").fadeIn(500);
    },
    stop: function(e, ui){
      $(".trashcan").fadeOut(500);
    },
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  }).disableSelection();;

});
