$(document).ready(function(){
  // 非同期にてヘッダーのカテゴリを表示
  function childBuild(children) {
    let child_category = `
                          <li class="category_child">
                            <a href="/categories/${children.id}"><input class="child-btn" type="button" value="${children.name}" name= "${children.id}">
                            </a>
                          </li>
                        `
    return child_category;    
  }
   
  function grandchildBuild(children) {
    let grandchild_category = `
                              <li class="category_grandchild">
                                <a href="/categories/${children.id}"><input class="grandchild-btn" type="button" value="${children.name}" name= "${children.id}">
                                </a>
                              </li>
                              `
    return grandchild_category
  }

  // カーソルが、カテゴリーから探すにきた際にイベント発火
  // 親カテゴリーを表示
  $('#category-btn').hover(function (e){
    // デフォルトのイベント（動作）をキャンセルする。
    e.preventDefault();
    // イベント発生元のイベントのみ実行したい場合などに使用する？
    e.stopPropagation();
    $('#category-menu').show();
    // $('.category-list').show();
  }, function(){

  });

  
  // 親カテゴリを表示
  $('')


});