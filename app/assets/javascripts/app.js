console.log('APP');
$(function(){
  $('#submit-button').click(function(e) {
    window.location = '/search?term=' + $('#search').val()
  })
});
