$(document).on('turbolinks:load', function() {

  $('#exercise_workout_date').datepicker({ dateFormat: 'yy-mm-dd' });

  var regex = /\/users\/\d+\/exercises$|\/Friendships\/\d+/i;

  if($(location).attr('pathname').match(regex)) {
    drawChart();
  }

  var height = $('#messages-box').height();
  $('#followers').css('height', height);

});