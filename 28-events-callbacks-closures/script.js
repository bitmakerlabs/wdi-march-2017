$(function() {
  // This is where the jQuery code goes
  // The DOM is guaranteed to be ready here

  // Select the element with id 'click-bait'
  $('#click-bait').on('click', function(eventObject) {
    // This will happen when #click-bait is clicked
    eventObject.preventDefault();
    window.alert('#click-bait was clicked!');
  });

  function secondLevelEventHandler(e) {
    e.stopPropagation();
    window.alert('#second-level received a click!');
  }

  $('#second-level').on('click', secondLevelEventHandler);

  var firstLevelEventHandler = function() {
    window.alert('#first-level received a click!');
  };

  $('#first-level').on('click', firstLevelEventHandler);

  $(window).on('keyup', function(e) {
    $('.keypressed').html(e.which);
  });
});

// $(document).on('ready', function() {
//
// });

// $(document).ready(function() {
//
// });
