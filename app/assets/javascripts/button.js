$(function() {
  $(".between-btn").click(function(e) {
    var i_tag = $(this).find(".material-icons")
    switch(i_tag.text()) {
      case "favorite":
        e.preventDefault();
        i_tag.text("done");
        i_tag.parent().addClass("disabled");
        break;
      case "done":
        return false;
      case "reply":
        e.preventDefault();
        i_tag.text("message");
        break;
      case "message":
      case "settings":
    }
    // ajax通信
    var id = $(this).data("user")
    $.ajax({
      type:'GET',
      url:'/api/relations',
      data:{id: id},
      dataType:'json',
      success: function(data, dataType) {
        console.log("success");
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) {
        console.log("error");
      }
    })
  })

})