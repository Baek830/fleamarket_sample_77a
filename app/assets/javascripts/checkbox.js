$(document).on('turbolinks:load', function() {
  let password = ["#user_password","#user_password_confirmation"];
  let passcheck = "#check";

  $(passcheck).change(function() {
    if ($(this).prop("checked")) {
      $(password.join()).attr("type","text");
    } else {
      $(password.join()).attr("type","password");
    }
  });
});