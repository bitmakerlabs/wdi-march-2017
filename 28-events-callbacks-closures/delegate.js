// Global scope

$(document).ready(function() {
  // Function scope

  var count = 0,
      colors = ['tomato', 'azure', 'green', 'orange', 'purple', 'chartreuse', 'yellow', 'chocolate'];


  $('#box-maker').on('click', function() {
      var x = Math.ceil(Math.random() * 400),
          y = Math.ceil(Math.random() * 200),
          c = Math.ceil(Math.random() * 8);

      $('<div class="circle"></div>')
          .css({
              top: y,
              left: x,
              backgroundColor: colors[c]
          })
          .html(count++)
          .appendTo('#container');

      console.log('link was clicked');
  });

  $('#container').on('click', '.circle', function() {
    // 'this' is the DOM element that received the event within the event handler
    $(this).remove();
    count--;
  });
});
