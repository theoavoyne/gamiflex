var Turbolinks = require("turbolinks")
Turbolinks.start()

const loadingContent = document.getElementById('loading-container');
const landingButton = document.getElementById('landing-button')

// // function display(timeout) {
// //   loadingContent.style.display = 'block';
// //   setTimeout(function() {
// //     loadingContent.style.display = 'none';
// //     }, timeout);
// // }

// // window.onload = function () {
// //   let timeLoad = window.performance.timing.domContentLoadedEventEnd-window.performance.timing.navigationStart;
// //   console.log('Restart for' + timeLoad);
// //   display(timeLoad + 5000);
// // }

// ////////////////////////////////////////////////////////////////
landingButton.addEventListener("turbolinks:request-start", function(){
  const loadingContent = document.getElementById('loading-container');
  loadingContent.style.display = 'block';
  console.log('coucou');
});

document.addEventListener("turbolinks:load", function(){
  loadingContent.style.display = 'none';
  console.log('coucou2');
});
// ///////////////////////////////////////////////////////////



// // const images = document.querySelectorAll('.loading-images');
// // const names = document.querySelectorAll('.game-names');
// // const operation = document.getElementById('operation');
// // const comparingText = document.getElementById('comparing');

// // let i = -1;

// // function changeImage() {
// //   i += 1;
// //   if(i < images.length) {
// //     images[i - 1].style.display = 'none';
// //     images[i].style.display = 'block';
// //     names[i - 1].style.display = 'none';
// //     names[i].style.display = 'block';
// //   } else {
// //     i = 0;
// //     images[images.length - 1].style.display = 'none';
// //     names[names.length - 1].style.display = 'none';
// //   }
// // }

// // const operationNames = ['Receiving...', 'Standardizing...', 'Standardizing...', 'Crossing user data...', 'Sorting...']

// // let e = 0;
// // function operations() {
// //   operation.innerText = `${operationNames[e]}`;
// //   if (e != 4) {
// //     e += 1;
// //   };
// // }

// // let g = 0;
// // function comparing() {
// //   comparingText.innerText = `${backtick(g)}`;
// //   g += Math.floor(Math.random() * 300);
// // }

// // function backtick(number) {
// //   if (number > 1000) {
// //     return (new Intl.NumberFormat().format(number));
// //   }
// // }

// // setInterval(operations, 800);
// // setInterval(comparing, 10);
// // setInterval(changeImage, 85);


// // const line = document.getElementById('line');

// // let j = 10;
// // let dir = 1

// // function moveLineRight() {
// //   j += (dir * 3);
// //   line.style.width = `${j}px`;
// //   if(j > 400 || j <= 0){
// //     dir *= -1;
// //   }
// // }

// // setInterval(moveLineRight, 1);



