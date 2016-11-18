/*------------------------------------------------------------------
 * Theme Name: HostRocket v2 Responsive HTML5 Landing page
 * Theme URI: http://www.brandio.io/envato/hostrocket-v2
 * Author: Brandio
 * Author URI: http://www.brandio.io/
 * Description: A Bootstrap Responsive HTML5 Landing page
 * Version: 1.0
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * Bootstrap v3.3.6 (http://getbootstrap.com)
 * Copyright 2016 Brandio.
 -------------------------------------------------------------------*/

"use strict";
$(document).ready(function(){
    for(var i=1;i<=4;i++){
       $("#info-box"+i).click(function(){
           $("#info-box1").removeClass("opened-info");
           $("#info-box2").removeClass("opened-info");
           $("#info-box3").removeClass("opened-info");
           $("#info-box4").removeClass("opened-info");
           $("#info-text1").addClass("info-closed");
           $("#info-text2").addClass("info-closed");
           $("#info-text3").addClass("info-closed");
           $("#info-text4").addClass("info-closed");
           
           var getNum = $(this).attr('id').replace(/[A-Za-z$-]/g, "");

           $("#info-text"+getNum).removeClass("info-closed");
           $(this).addClass("opened-info");
       });
    } 
    
    $('.testimonials-slider').slick({
        dots: true,
        arrows: true,
        speed: 200,
        prevArrow: '<i class="fa fa-chevron-left prev-arrow"></i>',
        nextArrow: '<i class="fa fa-chevron-right next-arrow"></i>'
    });
    
    $('a[href^="#"]').on('click', function(e) {
        e.preventDefault();
        $(document).off("scroll");

        var target = this.hash;
        var $target = $(target);

        $('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 900, 'swing', function() {
            window.location.hash = target;
        });
    });
    
    $("#search-domain").on('click', function(){
        var domain=$("#domain-text").val();
        var checkdomain=ValidURL(domain);
        if(checkdomain){
            window.location.href = "https://www.name.com/domain/search-4-4/?keyword="+domain;
        }else{
            alert("Please enter a valid domain.");
        }
    });
    function ValidURL(str) {
      var pattern = new RegExp('((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|'+ // domain name
  '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
  '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
  '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
  '(\\#[-a-z\\d_]*)?$','i'); // fragment locator
      if(!pattern.test(str)) {
        return false;
      } else {
        return true;
      }
    }
});