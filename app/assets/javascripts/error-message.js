$(function(){
  function buildErrorMessage(id, message){
    let html = `<div class="error-message" id="${id}">
                  <p>${message}</p>
                </div>`
    return html;
  }
  function deleteErrorMessage(id){
    $(`#${id}`).text('');
  }
  $('input[type=file]').on('change', function(){
    if ($('#preview-box__0').width != 0) {
      deleteErrorMessage('photo');
    }
  });
  $('#field__input-product-name').on('keyup', function() {
    let productName = $(this).val();
    if (productName == '') {
      $('.product-name-wrapper').append(buildErrorMessage('name', '入力してください'));
      $(this).css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('name');
      $(this).css({'borderColor': '#ccc'});
    }
  });
  $('.field__text-box').on('keyup', function() {
    let productDscr = $(this).val();
    if (productDscr == '') {
      $('.product-dscr-wrapper').append(buildErrorMessage('dscr','入力してください'));
      $(this).css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('dscr');
      $(this).css({'borderColor': '#ccc'});
    }
  });
  $('.category-select-grandchildren').on('change', function(){
    let productCategory = $('#grandchildren_category option:selected').data('category');
    if (productCategory == '') {
      $('.product-category-wrapper').append(buildErrorMessage('category', '選択してください'));
      $('#grandchildren_category').css({'borderColor': '#ff0211'});
      $('#parent_category').css({'borderColor': '#ff0211'});
      $('#children_category').css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('category');
      $('#grandchildren_category').css({'borderColor': '#ccc'});
      $('#parent_category').css({'borderColor': '#ccc'});
      $('#children_category').css({'borderColor': '#ccc'});
    }
  });

  $('#field__selector-product-condition').on('change', function(){
    let productCondition = $(this).val();
    if (productCondition == '') {
      $('.product-condition-wrapper').append(buildErrorMessage('condition','選択してください'));
      $(this).css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('condition');
      $(this).css({'borderColor': '#ccc'});
    }
  });

  $('#field__selector-shipping-cost').on('change', function(){
    let shippingCost = $(this).val();
    if (shippingCost == '') {
      $('.shipping-cost-wrapper').append(buildErrorMessage('shipping-cost','選択してください'));
      $(this).css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('shipping-cost');
      $(this).css({'borderColor': '#ccc'});
    }
  });

  $('#field__selector-prefecture').on('change', function(){
    let prefecture = $(this).val();
    if (prefecture == '') {
      $('.prefecture-wrapper').append(buildErrorMessage('prefecture','選択してください'));
      $(this).css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('prefecture');
      $(this).css({'borderColor': '#ccc'});
    }
  });

  $('#field__selector-date').on('change', function(){
    let date = $(this).val();
    if (date == '') {
      $('.date-wrapper').append(buildErrorMessage('date','選択してください'));
      $(this).css({'borderColor': '#ff0211'});
    } else {
      deleteErrorMessage('date');
      $(this).css({'borderColor': '#ccc'});
    }
  });

  $('#field__input-price').on('keyup', function(){
    let price = $(this).val();
    if (price > 10000000 || price < 300 ) {
      $(this).css({'borderColor': '#ff0211'});
      $('#price').css({'display': 'block'});
    } else {
      $('#price').css({'display': 'none'});
      $(this).css({'borderColor': '#ccc'});
    }
  });
})

