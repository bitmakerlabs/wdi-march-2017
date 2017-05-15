// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {

  // Step 1: Listen to the click event on the link
  $('.robot > a').on('click', function(event) {

    // Step 2: Prevent the default beahaviour of clicking on a link
    event.preventDefault();

    // Step 3: Make the ajax request
    url = $(this).attr('href');
    $.ajax({
      url: url,
      method: 'GET',
      dataType: 'json'
    }).done(function(data) {
      // Step 4: Update the page

      // 1. Fetch the HTML template string
      var source = $("#robot-template").html();

      // 2. Create a function that will replace placeholders given an object
      var template = Handlebars.compile(source);

      // 3. Hydrate the template with the data provided by the server
      var robotHtml = template(data);

      // 4. Put the HTML into the page
      $('#robot-details').html(robotHtml);
    });

  });
});
