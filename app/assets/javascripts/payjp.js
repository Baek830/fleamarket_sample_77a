$(document).on('turbolinks:load',function(){
  
  Payjp.setPublicKey('pk_test_7b773292083cfc83d995662f');

  let form = $(".form");

  $("#charge-form").click(function(){
    form.find("input[type=submit]").prop("disabled", true);

    let card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    };

    Payjp.createToken(card, function(status, response) {
      if (response.error){
  
        form.find('.payment-errors').text(response.error.message);
        form.find('button').prop('disabled', false);
        $('#charge-form').removeAttr("disabled");
      }
      else {

        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        let token = response.id;
        form.append($('<input type="hidden" name="payjpToken" />').val(token));
        form.get(0).submit();
      };
    });
  });
});