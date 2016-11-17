/*------------------------------------------------------------------
 * Theme Name: Hostbox Responsive HTML5 Landing page
 * Theme URI: http://www.iunique.me/brandesign/hostbox
 * Author: Brandesign
 * Author URI: http://www.iunique.me/brandesign
 * Description: A Bootstrap Responsive HTML5 Landing page
 * Version: 1.0
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * Bootstrap v3.3.4 (http://getbootstrap.com)
 * Copyright 2015 Brandesign.
 -------------------------------------------------------------------*/
 
"use strict";
//-- Accent Color ----
var accentColor = "#4d2692";

function setAccentColor () {
$('.accent-color-bg').css('background-color', accentColor);
$('.accent-color-text').css('color', accentColor);
$('.accent-color-border').css('border-color', accentColor);

$(".menu-holder a").on("hover",function(e) { 
    $(this).css("color",e.type === "mouseenter"?accentColor:"#ffffff");
});
}
setAccentColor();
//---------------------

function checkScreenSize(){
    if (Modernizr.mq('(max-width: 767px)')) {
        $("#main-button").removeClass("hide");
        $("#main-menu").removeClass("inline-menu");
        $("#main-menu").addClass("fullpage-menu");
    } else {
        $("#main-button").addClass("hide");
        $("#main-menu").removeClass("fullpage-menu");
        $("#main-menu").addClass("inline-menu");
    }
}
$(document).ready(function() {
    checkScreenSize();
    $(window).on('resize', function(){
        checkScreenSize();
    });
  	var c=0;
	
	var words=['Affordable','Amazing','Wonderful','Incredible'];
	function loop(){
  		$('.header-text-1 .word').delay(3000).fadeTo(300,0,function(){
     		$(this).text( words[++c%words.length] ).fadeTo(300,1,loop);
  		});
	}    
	loop();
	
	$(".menu-button").on("click",function(){
		$(".fullpage-menu").addClass("menu-opened");
		return false;
	});
	$(".close-btn").on("click",function(){
		$(".fullpage-menu").removeClass("menu-opened");
		return false;
	});
	$(".menu-link").on("click",function(){
		$(".fullpage-menu").removeClass("menu-opened");
		return false;
	});
	
	var boxOpened=false;
	function openCloseBox(){
		if(!boxOpened){
			openBox();
		}else{
			closeBox();
		}
	}
	
	$(".box3d").on( "click", openCloseBox );
	
	function openBox(){
			$(".box3d").off( "click", openCloseBox );
			setTimeout(function(){
				boxOpened=true;
				$(".box3d").on( "click", openCloseBox );
			}, 1000);
			$(".box3d-top").addClass("box3d-open");
			setTimeout(function(){
       			$(".feature1").removeClass("inside-box-left");
			}, 400);
			setTimeout(function(){
				$(".feature2").removeClass("inside-box-left");
			}, 500);
			setTimeout(function(){
				$(".feature3").removeClass("inside-box-right");
			}, 600);
			setTimeout(function(){
				$(".feature4").removeClass("inside-box-right");
			}, 700);
			
			return false;
	}
	var closing=false;
	function closeBox(){
			$(".box3d").off( "click", openCloseBox );
			setTimeout(function(){
				boxOpened=false;
				closing=true;
				$(".box3d").on( "click", openCloseBox );
			}, 1000);
			setTimeout(function(){
				$(".box3d-top").removeClass("box3d-open");
			}, 600);
			for(var i=1;i<=4;i++){
				$(".feature-line",".feature"+i).addClass("feature-line-hide");
				$(".feature-star",".feature"+i).addClass("feature-star-hide");
				$("#feature-details"+i).addClass("hide-f-details");
			}
       		$(".feature1").addClass("inside-box-left");
			$(".feature2").addClass("inside-box-left");
			$(".feature3").addClass("inside-box-right");
			$(".feature4").addClass("inside-box-right");
			
			setTimeout(function(){
				closing=false;
			},2000);
			
			return false;
	}
	
	function setBgToMenuBar(){
		if($(document).scrollTop() > 50){
       		$('.logo-menu').addClass('accent-color-bg');
			if(!closing){
				openBox();
			}
    	} else {
    		$('.logo-menu').removeClass('accent-color-bg');
			$('.logo-menu').removeAttr( "style" );
    	}
	}
	setBgToMenuBar();
	setAccentColor();
	//var a = $(".logo-menu").offset().top;
	$(document).scroll(function(){
    	setBgToMenuBar();
		setAccentColor();
	});
	
	$(".feature-button").on('click',function featureClick(e){
		var buttonNum=$(this).data("num");
		for(var i=1;i<=4;i++){
			if(i==buttonNum){
				$(".feature-line",".feature"+i).removeClass("feature-line-hide");
				$(".feature-star",".feature"+i).removeClass("feature-star-hide");
				$("#feature-details"+i).removeClass("hide-f-details");
			}else{
				$(".feature-line",".feature"+i).addClass("feature-line-hide");
				$(".feature-star",".feature"+i).addClass("feature-star-hide");
				$("#feature-details"+i).addClass("hide-f-details");
			}
		}
		return false;
	});

	$('.people-slider').on('click', '.person-details', function() {
  		var personNum=$(this).data("num");
		
		$(".testimonial-text").addClass("testimonial-text-hide");
		$(".t"+personNum,".testimonial-text-holder").removeClass("testimonial-text-hide");
		
		$(".person-details").removeClass("person-details-show");
		$(this).addClass("person-details-show");
		
		return false;
	});
	
	$("#contactform").validate({
  		submitHandler: function(form) {
				$("#submit").addClass("loading");

				var name=$("input[name*='name']").val();
				var email=$("input[name*='email']").val();
				var description=$("textarea[name*='description']").val();
				
				$.ajax({
      				url:'submitform.php',
      				type: "POST",
      				data: {
          				name: name,
          				email: email,
		  				description: description
            		}
   				}).done(function() {
					$('#contactform')[0].reset();
					$("#submit").addClass("hide-loading");
      				$(".done").addClass("finish");
					setTimeout(function() {
     					$("#submit").removeClass("loading");
      					$("#submit").removeClass("hide-loading");
      					$(".done").removeClass("finish");
    				}, 2000);
   				}).fail(function() {
					$('#contactform')[0].reset();
					$("#submit").addClass("hide-loading");
      				$(".failed").addClass("finish");
					setTimeout(function() {
     					$("#submit").removeClass("loading");
      					$("#submit").removeClass("hide-loading");
      					$(".failed").removeClass("finish");
    				}, 2000);
				});
  		}
	});
});


$('.partners-slider').slick({
  dots: true,
  infinite: false,
  speed: 300,
  slidesToShow: 5,
  slidesToScroll: 1,
  responsive: [
    {breakpoint: 1024,settings: {slidesToShow: 5,slidesToScroll: 1,infinite: true,dots: true}},
	{breakpoint: 990,settings: {slidesToShow: 4,slidesToScroll: 1}},
	{breakpoint: 800,settings: {slidesToShow: 3,slidesToScroll: 1}},
    {breakpoint: 600,settings: {slidesToShow: 2,slidesToScroll: 1}},
    {breakpoint: 480,settings: {slidesToShow: 1,slidesToScroll: 1}}
  ]
});


$('.people-slider').slick({
  dots: true,
  infinite: false,
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 1,
  responsive: [
    {breakpoint: 1024,settings: {slidesToShow: 4,slidesToScroll: 1,infinite: true,dots: true}},
	{breakpoint: 990,settings: {slidesToShow: 3,slidesToScroll: 1}},
	{breakpoint: 800,settings: {slidesToShow: 3,slidesToScroll: 1}},
    {breakpoint: 600,settings: {slidesToShow: 2,slidesToScroll: 1}},
    {breakpoint: 480,settings: {slidesToShow: 1,slidesToScroll: 1}}
  ]
});

var canvas, stage, exportRoot;

function init() {
	canvas = document.getElementById("logo-canvas");
	exportRoot = new lib.logo();

	stage = new createjs.Stage(canvas);
	stage.addChild(exportRoot);
	stage.update();

	createjs.Ticker.setFPS(lib.properties.fps);
	createjs.Ticker.addEventListener("tick", stage);
}

$(function() {
  $('a[href*=#]:not([href=#])').on("click",function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top-70
        }, 1000);
        return false;
      }
    }
  });
});