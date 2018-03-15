console.log("hello")

import "slick-carousel";

$(document).ready(function(){
  $('.autoplay-top-rated').slick({
    arrows: false,
    slidesToShow: 3,
    infinite: true,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    variableWidth: true,
  });
  $('.autoplay-currently-consulted').slick({
    arrows: false,
    slidesToShow: 3,
    infinite: true,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2500,
    variableWidth: true,
  });
});
