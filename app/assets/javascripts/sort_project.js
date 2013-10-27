$(function() {
  return $('#projects').sortable({
    handle: '.handle',
    opacity: 0.8,
    start: function(e, ui){
      $(ui.placeholder).hide(500);
    },
    stop: function(e, ui){
      $(ui.placeholder).show(500);
    },
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
  $('#projects').disableSelection();
});
