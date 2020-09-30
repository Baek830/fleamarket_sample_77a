$(document).on('turbolinks:load', function() {
  let tabs = $(".mypage-tab__menu-item");
  let contents = $(".mypage-content__detail");

  tabs.click(function(e) {
    e.preventDefault();
    $(tabs).removeClass("active");
    $(this).addClass("active");
    $(contents).removeClass("show");
    const index = tabs.index(this);
    contents.eq(index).addClass("show");
  });
});

$(document).on('turbolinks:load', function() {
  let tabs = $(".mypage-tab__menu-buy-item");
  let contents = $(".mypage-content__item");

  tabs.click(function(e) {
    e.preventDefault();
    $(tabs).removeClass("active");
    $(this).addClass("active");
    $(contents).removeClass("show");
    const index = tabs.index(this);
    contents.eq(index).addClass("show");
  });
});