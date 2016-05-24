$(document).ready(function() {

  $('.bs-example-modal-lg').on('click', '#new-question', function(e) {
    e.preventDefault();
    console.log("HERE");
    var $current_last_question = $( ".last-question" ).last();
    var $clone = $current_last_question.clone();
    $current_last_question.after($clone);


    // $clone.name = 'game[questions][query'+ '2' +']'

    // $('#questions-area').append('<%= q.text_area :query, placeholder: "Question", class: "form-field" %>');
    // $('#questions-area').append('<h1>NIHAO</h1>');
    // $('.last-question').after('<%= q.text_area :query, placeholder: "Question", class: "form-field new-question" %>');
    // $('.last-question').removeClass('last-question');
    // $('.new-question').addClass('last-question');
    // $('.new-question').removeClass('new-question');
  })

  $('.game_card').mouseenter(function() {
    $(this).find('#game_card-buttons').toggle();
    console.log($(this));
  });

  $('.game_card').mouseleave(function() {
    $(this).find('#game_card-buttons').toggle();
  });

  $('.game_card').on('click', '#play-game', function(e) {
    e.preventDefault();

    window.location.pathname = '/games/' + $(this).parent().parent().attr('id') + '/play'
  })
});