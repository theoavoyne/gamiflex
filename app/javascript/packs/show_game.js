const couterShowGame = document.getElementById('couter-show-game');
const couterShowGame2 = document.getElementById('couter-show-game-2');

let intervalA = null;
let intervalB = null;

function triggerInterval() {
  intervalA = setInterval(increaseNumber1, 20);
  intervalB = setInterval(increaseNumber2, 20);
}

let i = 0;
const percent = couterShowGame.dataset.percent;

function increaseNumber1() {
  i += 1;
  if(i > percent) {
    clearInterval(intervalA);
  } else {
    couterShowGame.innerText = `${i}`;
  }
}

let j = 0;
const percent2 = couterShowGame2.dataset.percent;

function increaseNumber2() {
  j += 1;
  if(j > percent2) {
    clearInterval(intervalB);
  } else {
    couterShowGame2.innerText = `${j}`;
  }
}

triggerInterval();

