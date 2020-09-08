
function printHelloWithButton() {
  let btn = document.getElementsByClassName(".like-btn-inner");

  function  printHello() {
    console.log("Hello");
  }

  btn.addEventListener("click", printHello);
}

window.addEventListener("load", printHelloWithButton);