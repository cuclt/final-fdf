$(document).ready(function() {
  $('#comment').on('click',function(e) {
    productId = $('#product-id').val();
    content = $('#content').val();
    console.log(productId + ' ' + content);
    $.ajax({
      type: "POST",
      url: "/comments",
      dataType: "json",
       data: {
          comment: {
            content: content,
            product_id: productId
          }
        },
      success: function(data) {
        console.log(data);
        display = "<div class='media response-info'>" +
          "<div class='media-left response-text-left'>" +
          "<a href='/products/42'>" + "<img src="  + data.user.avatar.url  +
          " alt='U97a4182 400x400 1 ' /></a>" +
          "<h5><a href='#'>"+ data.user.name +
          "</a></h5>" +
          "</div> <div class='media-body response-text-right'> " +
          data.comment.content +
          "<ul><a href='single.html'>Reply</a></li>" +
          "</ul> </div> <div class='clearfix'> </div> </div>"
        $('#comments-container').append(display);
        $('#content').val('')
      },
      error: function(error_message) {
          alert('Error');
        }
    });
  });
});
