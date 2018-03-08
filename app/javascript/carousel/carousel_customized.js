import "slick-carousel";

const arrayOfImages = ["https://picsum.photos/200/300?image=1", "https://picsum.photos/200/300?image=11",
                       "https://picsum.photos/200/300?image=2", "https://picsum.photos/200/300?image=12",
                       "https://picsum.photos/200/300?image=3", "https://picsum.photos/200/300?image=13",
                       "https://picsum.photos/200/300?image=4", "https://picsum.photos/200/300?image=14",
                       "https://picsum.photos/200/300?image=5", "https://picsum.photos/200/300?image=15",
                       "https://picsum.photos/200/300?image=6", "https://picsum.photos/200/300?image=16",
                       "https://picsum.photos/200/300?image=7", "https://picsum.photos/200/300?image=17",
                       "https://picsum.photos/200/300?image=8", "https://picsum.photos/200/300?image=18",
                       "https://picsum.photos/200/300?image=9", "https://picsum.photos/200/300?image=19",
                       "https://picsum.photos/200/300?image=10", "https://picsum.photos/200/300?image=20"]

// <% @games.each do |game| %>
//   arrayOfImages.push(<% game.image %>);
// <% end %>

const carousel = document.getElementById('slider');

/* Initialize the Slider */
function initCarousel() {
  for(let k = 0; k < arrayOfImages.length; k++) {
    carousel.insertAdjacentHTML('beforeend', `<div class="item-carousel">
    <img src="${arrayOfImages[k]}" alt=""></div>`);
  }
}

initCarousel();
////////////////////

/* Get the arrows(which are the side images) and each caraousel item */
const next = document.getElementById('nextArrow');
const prev = document.getElementById('prevArrow');
const cards = document.querySelectorAll('.item-carousel');
////////////////////

/* Implement Slick function */
$('.slider').slick({
  prevArrow: '#prevArrow',
  nextArrow: '#nextArrow',
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
