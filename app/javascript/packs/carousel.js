import "slick-carousel";

////////////////////
/* Implement Slick function */
$('.slider').slick({
  arrows: false,
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

/* Apply style to side images*/
function sideImages() {
  const active = document.querySelectorAll('.slick-active');
  const makeClickable = document.querySelectorAll('.slick-active .item-carousel');
  makeClickable[0].insertAdjacentHTML('afterbegin', `<div class="clickable leftClickable"></div>`);
  makeClickable[makeClickable.length - 1].insertAdjacentHTML('afterbegin', `<div class="clickable rightClickable"></div>`);

  active.forEach(function(card) {
    if( card == active[active.length - 1] || card == active[0] ) {
      card.style.transition = 'all 1s';
      card.style.opacity = '0.2';
      card.querySelector('.item-carousel').style.margin = '0 auto';
      card.style.paddingTop = '10px'; // modified
      card.style.paddingBottom = '10px'; // modified

    } else {
      card.style.opacity = '1';
      card.querySelector('.item-carousel').style.margin = '0';
      card.style.paddingTop = '0';
    }
  });

  $('.leftClickable').click(function(){
      $('.slider').slick('slickPrev');
      $('div').remove('.clickable');
      sideImages();
    })

  $('.rightClickable').click(function(){
      $('.slider').slick('slickNext');
      $('div').remove('.clickable');
      sideImages();
  })
}

sideImages();

///////////////////

window.addEventListener('resize', function(){
  sideImages();
});

/////////////////////

if(window.innerWidth < 1200) {
  sideImages();
}
