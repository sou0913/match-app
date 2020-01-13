$(function() {
  function isEmpty(str, jp) {
    if (str.length == 0) {
      return `${jp}が空です\n`;
    }
    else {return "";};
  };
  $(".my_register_button").click(function(e){
    e.preventDefault();
    var errMsg = "";
    var name = $("#my_register_name").val();
    var email = $("#my_register_email").val();
    $.ajax({
      url:'/api/users',
      type:'get',
      data:{email:email},
      dataType: 'json'
    })
    .done(function(response) {
      if(response.result == "no") {
        errMsg += "登録済みのemailです\n";
      }
      var password = $("#my_register_password").val();
      var password_c = $("#my_register_password_c").val();
      errMsg += isEmpty(name, "名前");
      errMsg += isEmpty(email,"eメール");
      errMsg += isEmpty(password, "パスワード");
      errMsg += isEmpty(password_c, "パスワード(確認)");
      if (errMsg) {
        alert(errMsg);
        errMsg = "";
      }
      else {
        $("#my_signup_form").submit();
      }
    })
    .fail(function(response) {
      alert("エラーです")
    })
  })
})
