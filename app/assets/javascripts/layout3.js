$(document).ready(function() {
  $('a[rel*=lazybox]').lazybox();
  // or with options
  $('a[rel*=lazybox]').lazybox({overlay: true, esc: true, close: true, modal: true, klass: 'class'});
});
