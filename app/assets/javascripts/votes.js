$(function(){
  $('.vote').on("ajax:success", function(e, response){
    $(this).html(response);
    console.log(response);
    console.log( 'I MADE IT TO THE VOTE AJAX REQUEST');

  });
});