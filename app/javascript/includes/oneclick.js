$(function(){
  $("#oneclick").on("click",function(){
    var product_id = 922;
    window.location.href = "/offers/create/" + product_id;
  });
});
