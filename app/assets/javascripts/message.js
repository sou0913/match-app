$(function(){
var controller = $('body').data("controller");
var action = $('body').data("action");

$("#message-send-btn").click(function(e) {
  var message = $("#message-content").val();
  if (message.length < 1) {
    e.preventDefault();
  }
})

// メッセージの自動更新機能
try {
  if (controller != "messages" || action != "show" ){throw new Error(e)}
  var user_id = $("#message-space-main").data("userId");
  $(`.message-block[data-user-id=${user_id}]`).addClass("message-self");
  $('.message-space-main').animate({ scrollTop: $('.message-space-main')[0].scrollHeight}); 
  // メッセージのマークアップ
  function buildHTML(message) {
    var self = (user_id == message.user_id) ? "message-self" : "" ;
    html = `<div class="message-block ${self}" data-id=${message.id}>
              <div class="message-top">
              <div class="message-user-name">
                ${message.user_name}
              </div>
              <div class="message-created-at">
                ${message.created_at}
              </div>
            </div>
            <div class="message-main-wrapper">
              <div class="message-main">
                ${message.content}
              </div>
            </div>
          </div>`
    return html;
  }

  // メッセージの自動更新
  function reloadMessages(){
    if ($(".message-block").length > 0){
      var id = $(".message-block").last().data("id");
    }
    else{ 
      var id = 0;
    }
    var user_id = $("#message-space-main").data("userId");
    var partner_id = $("#message-space-main").data("partnerId");
    var url = `/users/${user_id}/api/messages`;
    $.ajax({
      url: url,
      type: 'get',
      data: {id: id, partner_id: partner_id},
      dataType: 'json'
    })
    .done(function(messages) {
      var insertHTML = ""
      messages.forEach(function(message){
        insertHTML += buildHTML(message)
      })
      $(".message-space-main").append(insertHTML);
      if (insertHTML != ""){
        $('.message-space-main').animate({ scrollTop: $('.message-space-main')[0].scrollHeight}); 
      }
    })
    .fail(function() {
      alert('error')
    })
  }

  // 定期的に新規メッセージを取得
    setInterval(reloadMessages, 5000);
  }catch(e){}
})