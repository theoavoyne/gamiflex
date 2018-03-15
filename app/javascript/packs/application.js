/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

//= require turbolinks
//= require paloma
//= import "../carousel/slick.min";

console.log('Hello World from Webpacker mother fuckers!');

import "bootstrap";

import "../loading/loading";

$('.btn-search').click(function(){
  $('.btn-search').toggleClass('clicked-btn');
  $('.searchbar').toggleClass('clicked');

  if($('.searchbar').hasClass('clicked')){
    $('.btn-extended').focus();
  }
});

import "../scroll/scroll_up";


var $body = $('body');

var loading = [
    { elements: $body, properties: { width: '20%' } },
    { elements: $body, properties: { width: '30%' } },
    { elements: $body, properties: { width: '50%' } },
    { elements: $body, properties: { width: '100%' } },
    { elements: $body, properties: { height: '100%' }, options: {
      complete: function () {
        $('.autoplay-top-rated').velocity( 'transition.slideUpIn' );
        $('.autoplay-top-rated').velocity( 'transition.flipYIn' );
        $('html').css({ background: '#fff' });
      }
    }
  }
];
