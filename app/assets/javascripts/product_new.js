$(function () {
  $(document).on('click', '.image_upload', function() {
    var preview = $(
      `<div class="image-preview__wapper">
        <img class="preview">
      </div>
      <div class="image-preview_btn">
        <div class="image-preview_btn_delete">削除</div>
      </div>`
    );
    var append_input = $(
      `<li class="input">
        <label class="upload-label">
          <i class="fas fa-plus fa-2x"></i>
            <div class="input-area display-none">
              <input class="hidden image_upload" type="file">
            </div>
          </div>
        </label>
      </li>`
    );
    $ul = $('#previews');
    $li = $(this).parents('li');
    $label = $(this).parents('.upload-label');
    $inputs = $ul.find('.image_upload');
    $('.image_upload').on('change', function (e) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = function(e) {
        $(preview).find('.preview').attr('src', e.target.result);
      }
      $li.append(preview);
      $('#previews li').css({
        'width': `116px`
      })
      $label.css('display', 'none');
      $li.removeClass('input');
      $li.addClass('image-preview');
      $lis = $ul.find('.image-preview');
      
      if ($lis.length < 10) {
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width':`116px`
        })
      }
      $inputs.each(function (num, input) {
        $(input).removeAttr('name');
        $(input).attr({
          name: "product[images_attributes][" + num + "][image]",
          id: "images_attributes_" + num + "_image"
        });
      });
    });
  });

  $(document).on('click', '.image-preview_btn_delete', function () {
    var append_input = $(`<li class="input">
                            <label class="upload-label">
                              <div class="uploas-label__text">
                                <i class="fas fa-plus fa-2x"></i>
                                  <div class="input-area display-none">
                                    <input class="hidden image_upload" type="file">
                                  </div>
                              </div>
                            </label>
                          </li>`);
    $ul = $('previews')
    $lis = $ul.find('.image-preview');
    $li = $(this).parents('.image-preview');
    $li.remove();
    $lis = $ul.find('.image-preview');
    if ($lis.length == 9) {
      $ul.append(append_input)
    }
    $('#previews li:last-child').css({
      'width': `116px`
    })
  });
});


$(document).on('turbolinks:load',function(){
  $('#product_price').on('input', function(){
    const data = $('#product_price').val();
    const profit = Math.round(data * 0.9).toLocaleString('ja-JP', {style: 'currency', currency: 'JPY'});
    const fee = Math.round(data * 0.1).toLocaleString('ja-JP', {style: 'currency', currency: 'JPY'});
    $('.right_bar').html(fee)
    $('.right_bar_2').html(profit)
    $('#price').val(profit)
    if(profit == '') {
      $('.right_bar_2').html('');
      $('.right_bar').html('');
    }
  })
})