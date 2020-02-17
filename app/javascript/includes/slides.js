$(function(){
  var $activeSlide = $('#slides .slide:first-child');

  // $activeSlide.addClass("showing");

  $("#decline").on("click",function(){
    console.log("declined");
    goToSlide('decline');
  });


  $("#approve").on("click",function(){
    var product_id = $activeSlide.data("id");

    console.log(product_id);

    $.ajax({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      url: "/approve/" + product_id,
      method: "post",
      dataType: "ajax"
    });


    goToSlide('approve');
  });

  $("#offer").on("click",function(){
    var product_id = $activeSlide.data("id");
    console.log(product_id);

    $.ajax({
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    url: "offers/create/" + product_id,
    method: "post",
    dataType: "ajax"
    });
    goToSlide('offer');
  });


  function goToSlide(action) {
    $activeSlide.removeClass("showing");
    $activeSlide = $activeSlide.next(".slide");


    if(action == "approve"){
      console.log(action);
    } else {
      console.log(action);
    }
    $activeSlide.addClass("showing");
  }
});
