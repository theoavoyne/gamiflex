var Turbolinks = require("turbolinks")
Turbolinks.start()

const images = document.querySelectorAll('.loading-images');
const names = document.querySelectorAll('.game-names');
const operation = document.getElementById('operation');
const comparingText = document.getElementById('comparing');

let i = 0;

function changeImage() {
  i += 1;
  if(i < images.length) {
    images[i - 1].style.display = 'none';
    images[i].style.display = 'block';
    names[i - 1].style.display = 'none';
    names[i].style.display = 'block';
  } else {
    i = 0;
    images[images.length - 1].style.display = 'none';
    names[names.length - 1].style.display = 'none';
  }
}

const operationNames = ['Compiling data...', 'Receiving...', 'Standardizing...', 'Standardizing...', 'Crossing user data...', 'Sorting...']

let e = 0;
function operations() {
  operation.innerText = `${operationNames[e]}`;
  if (e != (5)) {
    e += 1;
  };
}

let g = 0;
function comparing() {
  comparingText.innerText = `${backtick(g)}`;
  g += Math.floor(Math.random() * 3000);
}

function backtick(number) {
  if (number > 1000) {
    return (new Intl.NumberFormat().format(number));
  }
}

const line = document.getElementById('line');

let j = 10;
let dir = 1

function moveLineRight() {
  j += (Math.random() * 30);
  line.style.width = `${j}px`;
  if(j > 400){
    j = 0;
  }
}

let interval1 = null;
let interval2 = null;
let interval3 = null;
let interval4 = null;
let interval5 = null;

function intervaux() {
  interval1 = setInterval(moveLineRight, 80);
  interval2 = setInterval(operations, 1200);
  interval3 = setInterval(comparing, 10);
  interval4 = setInterval(changeImage, 85);
}

function killInterval() {
  clearInterval(interval1);
  clearInterval(interval2);
  clearInterval(interval3);
  clearInterval(interval4);
  clearInterval(interval5);
}

intervaux();

let loadingContent = document.getElementById('loading-container');
let button = document.querySelector('.run-loading');
let button2 = document.querySelector('.run-loading-2');

if (button) {
  button.addEventListener("turbolinks:click", function(){
    loadingContent.style.display = 'block';
    intervaux();
  });
}

if (button2) {
  button2.addEventListener("turbolinks:click", function(){
    loadingContent.style.display = 'block';
    intervaux();
  });
}

document.addEventListener("turbolinks:render", function(){
  killInterval();
});
