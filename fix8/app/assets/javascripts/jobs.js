$(document).ready(function() {
  var bid_id
  console.log("ready!");



  $('.accept-bid').on('click', function(e) {
    e.preventDefault();
    bid_id = $(this).parent().attr("bid_id");
    console.log('hi!');
    var request
    request = $.ajax({
      url: "/bids/accept",
      type: "post",
      data: {id: bid_id},
      dataType: "json"
    });

    request.fail(function(response){
      console.log(response)
    })

    request.done(function() {
      window.location = "/"
    });

  });

});
