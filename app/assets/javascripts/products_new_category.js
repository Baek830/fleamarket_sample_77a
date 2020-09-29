$('turbolinks:render', function(){
  // 子カテゴリー、孫カテゴリー用に、selectボックスのoptionの入れ物を定義
  function appendOpction(category){
    let html = 
    `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 子カテゴリーのhtml
  function appendChildrenBox(insertHTML) {
    let childSelectHtml = '';
    childSelectHtml = 
      `<select class="field__selector", id="children_category">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}
      </select>`
    $('#children_box').append(childSelectHtml);
  }

  // 孫カテゴリーのhtml
  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml = 
      `<select class="field__selector" id="grandchildren_category" name="product[category_id]">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}</select>`
    $('#grandchildren_box').append(grandchildSelectHtml);
  }
  
  // 親カテゴリー選択によるイベント
  $(document).on("change","#parent_category", function(){
    // 選択された親カテゴリーの名前取得→コントローラーへ送る
    let parentCategory = $("#parent_category").val();
    if (parentCategory != "") {
      $.ajax( {
        type: 'GET',
        url: '/products/category_children',
        data: {parent_name: parentCategory},
        dataType: 'json'
      })
      .done(function(children){
        // 親カテゴリーが変更されたら、子カテゴリー、孫カテゴリーを初期値にする
        $("#children_box").empty();
        $("#grandchildren_box").empty();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOpction(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('error: カテゴリーの取得に失敗しました')
      })
    }else{
      $("#children_box").empty();
      $("#grandchildren_box").empty();
    }
  });


  // 子カテゴリー選択によるイベント発火
  $(document).on('change', '#children_box', function(){
    // 選択された子カテゴリーidを取得
    let childId = $('#children_category option:selected').data('category');
    // 子カテゴリーが初期値出ない場合
    if (childId != ""){
      $.ajax({
        url: '/products/category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        datatype: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $("#grandchildren_box").empty();
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOpction(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('error: カテゴリーの取得に失敗しました')
      })
    }else{
      $("#grandchildren_box").empty();
    }
  });
});