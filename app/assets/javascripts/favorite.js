
// function printHelloWithButton() {
//   let btn = document.getElementsByClassName(".like-btn-inner");

//   function  printHello() {
//     console.log("Hello");
//   }

//   btn.addEventListener("click", printHello);
// }

// window.addEventListener("load", printHelloWithButton);

$(function(){
  $('.like-btn-inner').on('click', function(e){

    e.preventDefault()
  });
});

$(function(){
  $('.dislike-btn-inner').on('click', function(e){

    e.preventDefault()
  });
});