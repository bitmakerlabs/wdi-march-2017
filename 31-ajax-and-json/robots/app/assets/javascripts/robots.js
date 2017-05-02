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

      // .html only works with html snippets,
      // not json
      //$('#robot-details').html(data);

      var profile_pic_src = 'http://robohash.org/' + data.address;
      $('<img>').attr('src', profile_pic_src).appendTo('#robot-details');

    });

  });
});
