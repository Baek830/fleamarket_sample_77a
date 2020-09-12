// $(function(){
//   $('body').on('click', '.like-btn-inner', function(e){
//     $('.like-btn-inner').removeClass( 'like-btn-inner' ).addClass( 'red-effect dislike-btn-inner' );
//     $('.product-like-btn').addClass('red-effect')
//     $('.heart').removeClass('far').addClass('fas')
//     e.preventDefault()
//     var url = $('.button_to').attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//   });

//   $('body').on('click', '.red-effect', function(e){
//     $('.dislike-btn-inner').removeClass( 'red-effect dislike-btn-inner' ).addClass( 'like-btn-inner' );
//     $('.product-like-btn').removeClass('red-effect')
//     $('.heart').removeClass('fas').addClass('far')
//     e.preventDefault()

//     var url = $('.button_to').attr('action');
//     $.ajax({
//       url: url,
//       type: "DELETE",
//       data:{"_method": "DELETE"},
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//   }); 
// });