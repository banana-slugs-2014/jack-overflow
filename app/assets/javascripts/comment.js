$(function(){
  $(document).on('click', 'a.new_comment', function(event,response){
    event.preventDefault()
    $(this).siblings('.comment_form').toggleClass('hidden')
  })

  $(document).on("ajax:success", '.comment_form', function(e, response){
    $(this).parent().append(response)
    $(this).children('form')[0].reset()
    $(this).toggleClass('hidden')
  });

})