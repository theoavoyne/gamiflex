import "slick-carousel";

const cards = document.querySelectorAll('.item-carousel');
////////////////////

/* Implement Slick function */
$('.slider').slick({
  prevArrow: '.rightClickable',
  nextArrow: '.leftClickable',
  slidesToShow: 6,
  slidesToScroll: 1,
  infinite: true,
  speed: 1000,
  responsive: [
    {
      breakpoint: 900,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1,
        infinite: true,
        speed: 1000
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true
      }
    }
  ]
});

////////////////////

/* Apply style to side images*/
function sideImages() {
  const active = document.querySelectorAll('.slick-active');

  active.forEach(function(card) {
    if( card == active[active.length - 1] || card == active[0] ) {
      card.style.transition = 'all 1s';
      card.style.opacity = '0.2';
      card.querySelector('.item-carousel').style.margin = '0 auto';
      card.style.paddingTop = '10px'; // modified
      card.style.paddingBottom = '10px'; // modified
      let makeClickable = document.querySelectorAll('.slick-active .non-clickable');
      makeClickable[0].style.backgroundColor = `blue`;
      makeClickable[0].classList.add('leftClickable');
      makeClickable[makeClickable.length - 1].style.backgroundColor = `green`;
      makeClickable[makeClickable.length - 1].classList.add('rightClickable');
    } else {
      card.style.opacity = '1';
      card.querySelector('.item-carousel').style.margin = '0';
      card.style.paddingTop = '0';
    }
  });
}

sideImages();

// function spanClickResize() {
//   const active = document.querySelectorAll('.slick-active img');
//   var rectLeft = active[0].getBoundingClientRect();
//   var rectRight = active[active.length - 1].getBoundingClientRect();

//   left.style.width = `${active[0].offsetWidth}px`;
//   right.style.width = `${active[active.length - 1].offsetWidth}px`;
//   left.style.height = `${active[0].offsetHeight}px`;
//   right.style.height = `${active[active.length - 1].offsetHeight}px`;

//   left.style.bottom = `calc(100vh - ${rectRight.bottom}px)`;
//   right.style.bottom = `calc(100vh - ${rectLeft.bottom}px)`;
//   left.style.left = `${rectLeft.left}px`;
//   right.style.left = `${rectRight.left}px`;

//   left.style.backgroundColor = `blue`;
//   right.style.backgroundColor = `red`;

// }

// spanClickResize();
const left = document.querySelector('.leftClickable');
const right = document.querySelector('.rightClickable');

window.addEventListener('resize', function(){
  sideImages();
});

left.addEventListener('click', function() {
  sideImages();
});

right.addEventListener('click', function() {
  sideImages();
});
////////////////////
if(window.innerWidth < 1200) {
  sideImages();
}

// // 'Help' Popover
// $(function () {
//   $('[data-toggle="popover"]').popover()
// })
