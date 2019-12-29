$(function() {
  function btn_html(link, icon, text,option) {
    var html =`<a href="${link}" class= "waves-effect waves-light btn ${option}" >
                 ${text}<i class="material-icons left">${icon}</i>
               </a>`;
    return html;
  };
  $(".between-btn").click(function(e) {
    var i_tag = $(this).find(".material-icons")
    var user_id = $(this).data("user");
    var partner_id = $(this).data("partner");
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
        $(this).empty();
        $(this).append(btn_html(`/users/${user_id}/messages/${partner_id}`,"message","メッセージを送る",""))
        break;
      case "message":
      case "settings":
    }
    // ajax通信
    $.ajax({
      type:'GET',
      url:'/api/relations',
      data:{id: partner_id},
      dataType:'json',
    })
    .done(function(response) {
      console.log("success");
    })
    .fail(function(xhr) {
      console.log("error");
    })
  })
})