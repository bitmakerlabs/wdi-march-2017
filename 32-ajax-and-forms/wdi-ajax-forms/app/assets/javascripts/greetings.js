// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// 0. Wait for the DOM to be ready
$(function() {
  // 1. Listen for the submit event on the form
  $('#greeting-form').on('submit', function(e) {
    // 2. Prevent the default behaviour
    e.preventDefault();

    // 3. Submit the AJAX request to the server
    $.ajax({
      method: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'html'
    }).done(function(data) {

      // On success
      console.log('submit was successful');
      console.log(data);

      // $('#greeting-list').prepend('<li>' + data.note + '<br />' + data.created_at + '</li>');
      $('#greeting-list').prepend(data);

    }).fail(function() {
      // On failure
      console.log('submit was NOT successful');
    }).always(function() {
      // No matter what
    });
  });
});
