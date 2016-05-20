$(document).ready(function() {
  // var imgs = ['laughing3.jpg', 'laughing4.jpg', 'laughing5.jpg', 'laughing2.jpg'];
  var imgs = ['bwlaughing3.jpg', 'bwlaughing4.jpg', 'bwlaughing5.jpg', 'bwlaughing2.jpg'];

  if (window.location.pathname == "/") {
    var index = 0;

      var imageUrl = imgs[imgs.length - 1]
      $('body').css('background', 'url(/assets/' + imageUrl + ') no-repeat center center fixed');
      $('body').css('-webkit-background-size', 'cover');
      $('body').css('-webkit-background-size', 'cover');
      $('body').css('-moz-background-size', 'cover');
      $('body').css('-o-background-size', 'cover');
      $('body').css('background-size', 'cover');

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

  // Login form show
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

  // Signup form show
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

  $('#splashpage-screen').on('click', '#login-submit', function(e) {
    e.preventDefault();
    var data = $(this).parent().serialize()
    var password = $(this).prev().val();
    var email = $(this).prev().prev().val();
    $.ajax({
      method: 'POST',
      url: '/session',
      data: {'email': email, 'password': password}
    })
    .done(function(response) {
      window.location.pathname = '/dashboard'
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("Fail");
      console.log(jqXHR.responseText);
      $('#login-form').remove();
      $('#signup-form').remove();
      $('#splashpage-screen').append(jqXHR.responseText)
    });
  })
});