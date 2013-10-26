$(function() {
  return $('#projects').sortable({
    handle: '.handle',
    opacity: 0.4,
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
