$(function(){

  $('.rating label').click(function(event) {
    $(this).nextAll('label').removeClass('fa-star').addClass('fa-star-o')
    $(this).prevAll('label').removeClass('fa-star-o').addClass('fa-star')
    if ($(this).hasClass('fa-star-o')) {
      $(this).removeClass('fa-star-o').addClass('fa-star')
    }
  })

});
