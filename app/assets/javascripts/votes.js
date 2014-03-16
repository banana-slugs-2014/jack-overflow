$(function(){
  $('.vote').on("ajax:success", function(e, data){
    $(this).html(data)
  });
});