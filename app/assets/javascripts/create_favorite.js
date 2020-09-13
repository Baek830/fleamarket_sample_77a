$(function(){
  function buildDislikeBtn(data){
    var html =
      `<button class= "default-btn product-dislike-btn red-effect">
        <%= button_to "いいね", 'product_favorite_path(@product, pre_like)',method: :delete, class "dislike-btn-inner red-effect" %>
      </button>`
    return html;
  }
  $('body').on('click', '.like-btn-inner', function(e){
    $('.like-btn-inner').removeClass( 'like-btn-inner' ).addClass( 'red-effect dislike-btn-inner' );
    $('.product-like-btn').addClass('red-effect')
    $('.heart').removeClass('far').addClass('fas')
    e.preventDefault()
    var url = $('.button_to').attr('action');
    $.ajax({
      url: url,
      type: "POST",
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done(function(data){
        var html = buildDislikeBtn(data);
        $('.product-btn-container__left').append(html)
      })
  });

  $('body').on('click', '.red-effect', function(e){
    $('.dislike-btn-inner').removeClass( 'red-effect dislike-btn-inner' ).addClass( 'like-btn-inner' );
    $('.product-like-btn').removeClass('red-effect')
    $('.heart').removeClass('fas').addClass('far')
    e.preventDefault()

    var formObject = $('.button_to');
    console.log(formObject);
    // formObject.action = /products/8/favorites/12;

    var url = $('.button_to').attr('action');
    $.ajax({
      url: url,
      type: 'DELETE',
      dataType: 'json',
      processData: false,
      contentType: false
    })
  });
});