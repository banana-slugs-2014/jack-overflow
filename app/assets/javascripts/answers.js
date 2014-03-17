$(function(){
  $('.answer_form').on("ajax:success", function(e, response){
    $('.answers').append(response)
    $('.answer_form form')[0].reset()
  });
});