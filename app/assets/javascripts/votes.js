$(function(){
  $(document).on("ajax:success", '.vote',function(e, response){
    $(this).html(response)
  });
});