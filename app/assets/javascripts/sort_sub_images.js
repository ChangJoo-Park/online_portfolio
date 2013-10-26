$(function() {
  return $('#sub_images').sortable({
    handle: '.handle',
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
