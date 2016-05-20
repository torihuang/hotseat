$(document).ready(function() {
  // var imgs = ['laughing3.jpg', 'laughing4.jpg', 'laughing5.jpg', 'laughing2.jpg'];
  var imgs = ['bwlaughing3.jpg', 'bwlaughing4.jpg', 'bwlaughing5.jpg', 'bwlaughing2.jpg'];

  if (window.location.pathname == "/") {
    var index = 0;

    var myInterval = setInterval(function () {
      var imageUrl = imgs[index]
      $('body').css('background', 'url(/assets/' + imageUrl + ') no-repeat center center fixed');
      $('body').css('-webkit-background-size', 'cover');
      $('body').css('-webkit-background-size', 'cover');
      $('body').css('-moz-background-size', 'cover');
      $('body').css('-o-background-size', 'cover');
      $('body').css('background-size', 'cover');
      index += 1;
      if (index == imgs.length) {
        index = 0;
      }
    },5000);
  };

  // Login
  $('#login').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    $.ajax({
      method: 'GET',
      url: '/session/new'
    })
    .done(function(response) {
      $('#login-form').remove();
      $('#signup-form').remove();
      $('#splashpage-screen').append(response)
    })
  });

  // Signup
  $('#signup').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
    $.ajax({
      method: 'GET',
      url: '/users/new'
    })
    .done(function(response) {
      $('#login-form').remove();
      $('#signup-form').remove();
      $('#splashpage-screen').append(response)
    })
  });
});