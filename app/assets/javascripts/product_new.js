// $(function(){
//   var file_field = document.querySelector('input[type=file]')
//   $('#img-file').change(function(){
//     var file = $('input[type="file"]').prop('files')[0];
//     var fileReader = new FileReader();
//     fileReader.onloadend = function() {
//       var src = fileReader.result
//       var html = `<img src="${src}" width="118" height="118">`
//       $('#image-box__container').before(html);
//     }
//     fileReader.readAsDataURL(file);
//   });
// });

// var html = `<div class='product-image' data-image="${file.name}">
//               <div class='product-image__content'>
//                 <div class='product-image__content--icon'>
//                   <img src=${src} width="118" height="118">
//                 </div>
//               </div>
//               <div class='product-image__operation'>
//                 <div class='product-image__operation-delete'>削除</div>
//               </div>
//             </div>`