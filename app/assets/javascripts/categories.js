$('turbolinks:render', function(){
  // 非同期にてヘッダーのカテゴリーを表示
  function childBuild(children) {
    let child_category = `
                        <li class="category_child">
                          <a href="/categories/${children.id}"><input class="child_btn" type="button" value="${children.name}" name= "${children.id}">
                          </a>
                        </li>
                        `
    return child_category;
  }

  function gcBuild(children) {
    let gc_category = `
                        <li class="category_grandchild">
                          <a href="/categories/${children.id}"><input class="gc_btn" type="button" value="${children.name}" name= "${children.id}">
                          </a>
                        </li>
                        `
    return gc_category;
  }

  // 親カテゴリーを表示
  $("#categoBtn").hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
      $("#tree_menu").show();
      $(".categoryTree").show();
  });

  // 子カテゴリーを表示
  $(".parent_btn").hover(function () {
    $(".parent_btn").css('color', '');
    $(".parent_btn").css('background-color', '');
    let categoryParent = $(this).attr('name');
      $.ajax({
        url: '/categories/search',
        type: 'GET',
        data: {
          parent_id: categoryParent
        },
        dataType: 'json'
      })
      .done(function (data) {
        $(".categoryTree-grandchild").hide();
        $(".category_child").remove();
        $(".category_grandchild").remove();
        $(".categoryTree-child").show();
        data.forEach(function (child) {
          let child_html = childBuild(child)
          $(".categoryTree-child").append(child_html);
        });
      })
      .fail(function () {
        alert("カテゴリーを選択してください");
    });
  });

  // 孫カテゴリーを表示
  $(document).on({
    mouseenter: function () {
      $(".child_btn").css('color', '');
      $(".child_btn").css('background-color', '');
      let categoryChild = $(this).attr('name');
        $.ajax({
          url: '/categories/search',
          type: 'GET',
          data: {
            children_id: categoryChild
          },
          dataType: 'json'
        })
        .done(function (gc_data) {
          $(".category_grandchild").remove();
          $(".categoryTree-grandchild").show();
          gc_data.forEach(function (gc) {
            let gc_html = gcBuild(gc)
            $(".categoryTree-grandchild").append(gc_html);
          });
        })
        .fail(function () {
          alert("カテゴリーを選択してください");
        });
    }
  }, ".child_btn"); 

  // カテゴリーを非表示
  $(document).on({
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
        $(".categoryTree-grandchild").hide();
        $(".categoryTree-child").hide();
        $(".categoryTree").hide();
        $(this).hide();
        $(".parent_btn").css('color', '');
        $(".parent_btn").css('background-color', '');
        $(".category_child").remove();
        $(".category_grandchild").remove();
    }
  }, "#tree_menu");
});