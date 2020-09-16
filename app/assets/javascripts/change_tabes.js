$(document).on('turbolinks:load', function() {
  let clicktab = ".active";
  let showitem = ".show";
  let tabs = $(".mypage-tab__menu-item");
  let contents = $(".mypage-content__detail");

  tabs.click(function(e) {
    e.preventDefault();
    $(clicktab).removeClass("active");
    $(this).addClass("active");
    $(showitem).removeClass("show");
    const index = tabs.index(this);
    contents.eq(index).addClass("show");
  });
});