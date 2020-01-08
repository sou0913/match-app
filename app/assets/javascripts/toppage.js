$(function(){
  var controller = $('body').data("controller");
  var action = $('body').data("action");
  try {
    if (controller != "sessions" || action != "new" ){throw new Error(e)}
    $('body').css("display", "none");
    $('body').fadeIn(3000);
  }catch(e){}

  $('.tabs').tabs({
    swipeable: true
  });
  $('.my_login_tab').click(function(){
    $('.my_login').addClass('my_active');
    $('.my_signup').removeClass('my_active');
  });
  $('.my_signin_tab').click(function(){
    $('.my_login').removeClass('my_active');
    $('.my_signup').addClass('my_active');
  })
});
