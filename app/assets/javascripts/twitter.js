$(".twitter-search").on("click", function(event) {
  event.preventDefault();
  var request = $.ajax({
    method: "GET",
    url: ("https://twitter.com"),
    dataType: "html"
  });
  request.success(function(data) {
    alert('we made it here, yo')
    // var review = $("#review"+reviewId);
    // var upcount = review.find(".up-count");
    // var downcount = review.find(".down-count");
    // var message = review.find(".ajax-message");
    // var initialMessage = review.find(".initial-message");
    // upcount.text(data.up);
    // downcount.text(data.down);
    // initialMessage.hide();
    // message.text("Thanks for your vote ");
    // message.append(showDelete(data.voteId, reviewId));
  });
  // request.error(function() {
  //   var review = $("#review"+reviewId);
  //   var message = review.find(".ajax-message");
  //   message.text("You must sign in to vote");
  // });
});
