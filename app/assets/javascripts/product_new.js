$(document).on('click', '.image_upload', function() {
  $ul = $("#previews");
  $li = $(this).parents("li");
  $label = $(this).parents(".upload-label");
  $inputs = $ul.find(".image_upload");
  var preview = $(
    `<div class="image-preview__wapper">
      <img class="preview">
    </div>
    <div class="image-preview_btn">
      <div class="image-preview_btn_edit">編集</div>
      <div class="image-preview_btn_delete">削除</div>
    </div>`
  );
  var append_input = $(
    `<li class="input">
      <label class="upload-label">
        <div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード
          <div class="input-area">
            <input class="hidden image_upload" type="file">
          </div>
        </div>
      </label>
    </li>`
  );
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