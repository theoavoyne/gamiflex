import "slick-carousel";

const next = document.getElementById('nextArrow');
const prev = document.getElementById('prevArrow');
const cards = document.querySelectorAll('.item-carousel');
////////////////////

/* Implement Slick function */
$('.slider').slick({
  prevArrow: '#nextArrow',
  nextArrow: '#prevArrow',
  slidesToShow: 6,
  slidesToScroll: 1,
  inifinite: true,
  speed: 1000,
  responsive: [
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 1,
        infinite: true,
      }
    },
  ]
});
////////////////////

/* Apply style to side images*/
function sideImages() {
  const active = document.querySelectorAll('.slick-active');
  active.forEach(function(card) {
    if( card == active[active.length - 1] || card == active[0] ) {
      card.style.opacity = '0.2';
      card.querySelector('img').style.width = '80%';
      card.querySelector('img').style.margin = '0 auto';
      card.style.paddingTop = '30px';
      card.style.transition = 'all 1s';
    } else {
      card.style.opacity = '1';
      card.querySelector('img').style.width = '100%';
      card.querySelector('img').style.margin = '0';
      card.style.paddingTop = '0';
    }
  });
}

sideImages();

next.addEventListener('click', function() {
  sideImages();
});

prev.addEventListener('click', function() {
  sideImages();
});
////////////////////
if(window.innerWidth < 1200) {
  sideImages();
}
