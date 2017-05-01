$(function() {

  $('#load-monsters').on('click', function() {
    console.log('Before .ajax');

    $.ajax({
      url: 'http://monsters-api.herokuapp.com/monsters',
      method: 'GET',
      dataType: 'html',
      // data: { limit: 2 },
    }).done(function(data) {
      console.log('.ajax done')
      $('body').append(data);
    }).fail(function(jqXHR, textStatus) {
      console.log('.ajax FAILED with ' + jqXHR.status + ' ' + jqXHR.statusText);
      console.log(jqXHR);
    }).always(function() {
      console.log('.ajax request finished');
    });

    console.log('After .ajax');
  });

  $('#add-monster').on('click', function() {
    $.ajax({
      url: 'http://monsters-api.herokuapp.com/monsters',
      method: 'POST',
      // dataType:,
      data: {
        monster: {
          name: 'Frankenstein',
          home: 'Transylvania',
          creepiness: 15
        }
      }
    }).done(function() {
      $('body').append('SUCCESS: Monster created');
    }).fail(function() {
      $('body').append('ERROR: Could not create monster');
    }).always(function() {
      $('body').append('Add operation complete');
    });
  });

});
