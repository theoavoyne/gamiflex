const counterShowGame = document.getElementById('counter-show-game');
const counterShowGame2 = document.getElementById('counter-show-game-2');

let intervalA = null;
let intervalB = null;

function triggerInterval() {
  intervalA = setInterval(increaseNumber1, 20);
  intervalB = setInterval(increaseNumber2, 20);
}

let i = 0;
const percent = counterShowGame.dataset.percent;

function increaseNumber1() {
  i += 1;
  if(i > percent) {
    clearInterval(intervalA);
  } else {
    counterShowGame.innerText = `${i}`;
  }
}

let j = 0;
const percent2 = counterShowGame2.dataset.percent;

function increaseNumber2() {
  j += 1;
  if(j > percent2) {
    clearInterval(intervalB);
  } else {
    counterShowGame2.innerText = `${j}`;
  }
}

triggerInterval();
