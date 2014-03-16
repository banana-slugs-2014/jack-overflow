$(function(){
  $('.vote').on("ajax:success", function(e, data){
    console.log(e);
  });
});
