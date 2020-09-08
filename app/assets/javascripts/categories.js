$(document).ready(function () {

  function childBuild(children) {
      let child_category = `
                          <li class="category_child">
                            <a href="/categories/${children.id}"><input class="child-btn" type="button" value="${children.name}" name= "${children.id}">
                            </a>
                          </li>
                          `
      return child_category;
    }
  
    function gcBuild(children) {
      let gc_category = `
                          <li class="category_grandchild">
                            <a href="/categories/${children.id}"><input class="gc-btn" type="button" value="${children.name}" name= "${children.id}">
                            </a>
                          </li>
                          `
      return gc_category;
    }

  // 親カテゴリーを表示
  $('#category-btn').hover(function (e) {
    e.preventDefault();
    e.stopPropagation();
    timeOut = setTimeout(function () {
      $('#category-menu').show();
      $('.category-list').show();
    })
  });
  
  // 子カテゴリーを表示
  $('.parent-btn').hover(function () {
    $('.parent-btn').css('color', '');
    $('.parent-btn').css('background-color', '');
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
        $(".category-list-grandchild").hide();
        $(".category_child").remove();
        $(".category_grandchild").remove();
        $('.category-list-child').show();
        data.forEach(function (child) {
          let child_html = childBuild(child)
          $(".category-list-child").append(child_html);
        });
        $('#category-menu').css('max-height', '750px');
      })
      .fail(function () {
        // alert("カテゴリーを選択してください");
      });
  }, function () {
        // あえて何も記述しない
  });

  // 孫カテゴリーを表示
  $(document).on({
    mouseenter: function () {
      $('.child-btn').css('color', '');
      $('.child-btn').css('background-color', '');
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
        $('.category-list-grandchild').show();
        gc_data.forEach(function (gc) {
          let gc_html = gcBuild(gc)
          $(".category-list-grandchild").append(gc_html);
          let parcol = $('.category-list').find(`input[name="${gc.root}"]`);
          $(parcol).css('color', 'white');
          $(parcol).css('background-color', '#3CCACE');
        });
        $('#category-menu').css('max-height', '750px');
      })
      .fail(function () {
        // alert("カテゴリーを選択してください");
      });
    },
  }, '.child-btn');

  // 孫カテゴリーを選択時
  $(document).on({
    mouseenter: function () {
      let categoryGc = $(this).attr('name');
      timeGc = setTimeout(function () {
        $.ajax({
          url: '/categories/search',
          type: 'GET',
          data: {
            gcchildren_id: categoryGc
          },
          dataType: 'json'
        })
        .done(function (gc_result) {
          let childcol = $('.category-list-child').find(`input[name="${gc_result[0].parent}"]`);
          $(childcol).css('color', 'white');
          $(childcol).css('background-color', '#b1e9eb');
          $('#category-menu').css('max-height', '750px');
        })
        .fail(function () {
          // alert("カテゴリーを選択してください");
        });
      })
    },
  }, '.gc-btn');

  // カテゴリーを非表示
  $(document).on({
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
      timeChosed = setTimeout(function () {
        $(".category-list-grandchild").hide();
        $(".category-list-child").hide();
        $(".category-list").hide();
        $(this).hide();
        $('.parent-btn').css('color', '');
        $('.parent-btn').css('background-color', '');
        $(".category_child").remove();
        $(".category_grandchild").remove();
      });
    },
  }, '#category-menu');

   // カテゴリーボタンの処理
   $(document).on({
    mouseenter: function (e) {
      e.stopPropagation();
      e.preventDefault();
      timeOpened = setTimeout(function () {
        $('#category-menu').show();
        $('.category-list').show();
      });
    },
    mouseleave: function (e) {
      e.stopPropagation();
      e.preventDefault();
      clearTimeout(timeOpened);
      $(".category-list-grandchild").hide();
      $(".category-list-child").hide();
      $(".category-list").hide();
      $("#category-menu").hide();
      $(".category_child").remove();
      $(".category_grandchild").remove();
    }
  }, '.header__contents__nav__listsLeft__item');
});