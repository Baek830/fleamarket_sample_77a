$(function(){


  $('body').on('click', '.like-btn-inner', function(e){
    $('.like-btn-inner').removeClass( 'like-btn-inner' ).addClass( 'red-effect dislike-btn-inner' );
    $('.product-like-btn').addClass('red-effect')
    $('.heart').removeClass('far').addClass('fas')
    console.log("hoge")
    e.preventDefault()
  });
  $('body').on('click', '.red-effect', function(e){
    $('.dislike-btn-inner').removeClass( 'red-effect dislike-btn-inner' ).addClass( 'like-btn-inner' );
    $('.product-like-btn').removeClass('red-effect')
    $('.heart').removeClass('fas').addClass('far')
    e.preventDefault()
  }); 

});

// $(function(){

// });