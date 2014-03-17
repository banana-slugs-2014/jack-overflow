$(function(){
  $('.vote').on("ajax:success", function(e, response){
    $(this).html(response);
  });
});