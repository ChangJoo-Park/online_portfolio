$(function(){
  $('#projects').sortable({
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'pointer',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.ajax({
        url: '/projects/sort',
        type: 'post',
        data: $('#projects').sortable('serialize'),
        dataType: 'script',
        complete: function(request){
          $('#projects').effect('highlight');
        }
      });
    }
  });
});
