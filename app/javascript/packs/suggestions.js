const counterSuggest = document.getElementById('counter-suggest');
const counterSuggest2 = document.getElementById('counter-suggest2');

let intervalC = null;
let intervalD = null;

function triggerInterval2() {
  intervalC = setInterval(increaseNumber3, 20);
  intervalD = setInterval(increaseNumber4, 20);
}

let k = 0;
const percent3 = counterSuggest.dataset.percent;

function increaseNumber3() {
  k += 1;
  if(k > percent3) {
    clearInterval(intervalC);
  } else {
    counterSuggest.innerText = `${k}`;
  }
}


let l = 0;
const percent4 = counterSuggest2.dataset.percent;

function increaseNumber4() {
  l += 1;
  if(l > percent4) {
    clearInterval(intervalD);
  } else {
    counterSuggest2.innerText = `${l}`;
  }
}

triggerInterval2();
