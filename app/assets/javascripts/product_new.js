$(document).on('turbolinks:load', function(){
  $(function(){
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                      <div class="upper-box">
                        <img src="" alt="preview">
                      </div>
                      <div class="lower-box">
                        <div class="delete-box" id="delete_btn_${count}">
                          <span>削除</span>
                        </div>
                      </div>
                    </div>`
      return html;
    }


    if (window.location.href.match(/\/products\/\d+\/edit/)){
      var count = $('.preview-box').length;
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      if (count < 5) {
        $('.label-content').css({'width': `calc(100% - (20% * ${count}))`});
      }
      else if (count == 5){
        $('.label-content').css({'width': `100%`});
      }
      else if (count <= 9){
        $('.label-content').css({'width': `calc(100% - (20% * (${count} - 5)))`});
      }
      if (count == 10) {
        $('.label-content').hide();
      }
    }

    function setLabel() {
      var count = $('.preview-box').length;
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      if (count < 5) {
        $('.label-content').css({'width': `calc(100% - (20% * ${count}))`});
      }
      else if (count == 5){
        $('.label-content').css({'width': `100%`});
      }
      else if (count <= 9){
        $('.label-content').css({'width': `calc(100% - (20% * (${count} - 5)))`});
        $('.prev-content').append($('.label-content'));
      }
      if (count == 10) {
        $('.label-content').hide();
      }

    }

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({id: `label-box--${id}`, for: `product_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          $('.prev-content').append(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        $('.prev-content').append($('.label-content'));
        if (count == 10) {
          $('.label-content').hide();
        }

        if ($(`#product_images_attributes_${id}__destroy`)){
          $(`#product_images_attributes_${id}__destroy`).prop('checked', false);
        }

        setLabel();
        if(count < 10) {
          $('.label-box').attr({id: `label-box--${count}`, for: `product_images_attributes_${count}_image`});
        }
      }
    });

    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      if ($(`#product_images_attributes_${id}__destroy`).length == 0) {
        $(`#product_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 9) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 9){
          $('.label-box').attr({id: `label-box--${id}`, for: `product_images_attributes_${id}_image`});
        }
      } else {
        $(`#product_images_attributes_${id}__destroy`).prop('checked', true);
        if (count == 9) {
          $('.label-content').show();
        }
        setLabel();
        if (id < 10) {
          $('.label-box').attr({id: `label-box--${id}`, for: `product_images_attributes_${id}_image`});
        }
      }
    });
  });
});


$(document).on('turbolinks:load',function(){
  $('#field__input-price').on('input', function(){
    let data = $(this).val();
    let profit = Math.round(data * 0.9).toLocaleString('ja-JP', {style: 'currency', currency: 'JPY'});
    let fee = Math.round(data * 0.1).toLocaleString('ja-JP', {style: 'currency', currency: 'JPY'});
    $('.right_bar').html(fee)
    $('.right_bar_2').html(profit)
    $('#price').val(profit)
    if(profit == '') {
      $('.right_bar_2').html('');
      $('.right_bar').html('');
    }
  })
})