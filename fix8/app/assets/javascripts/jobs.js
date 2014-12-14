$(document).ready(function() {
  console.log("ready!");

  $('.accept-bid').on('click', function(e) {
    e.preventDefault();
    var request
    request = $.ajax({
      url: "/bids"
      type: "POST"
      data: {id: bid_id}
      dataType: "json"
    });

    request.done(function() {
      window.location = "/"
    });

  });

});
