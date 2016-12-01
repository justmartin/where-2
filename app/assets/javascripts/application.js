// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	$('[data-toggle="tooltip"]').tooltip(); 

	$('#info-box1').click(function(){
    	$(".budget-plan-box").css('transform','scale(1.02)');
    	$(".budget-plan-box").css('opacity','1');
    	$(".midrange-plan-box").css('transform','scale(1.00)');
    	$(".midrange-plan-box").css('opacity','0.5');
    	$(".luxury-plan-box").css('transform','scale(1.00)');
    	$(".luxury-plan-box").css('opacity','0.5');
	});

	$('#info-box2').click(function(){
    	$(".midrange-plan-box").css('transform','scale(1.02)');
    	$(".midrange-plan-box").css('opacity','1');
    	$(".budget-plan-box").css('transform','scale(1.00)');
    	$(".budget-plan-box").css('opacity','0.5');
    	$(".luxury-plan-box").css('transform','scale(1.00)');
    	$(".luxury-plan-box").css('opacity','0.5');
	});

	$('#info-box3').click(function(){
    	$(".luxury-plan-box").css('transform','scale(1.02)');
    	$(".luxury-plan-box").css('opacity','1');
    	$(".budget-plan-box").css('transform','scale(1.00)');
    	$(".budget-plan-box").css('opacity','0.5');
    	$(".midrange-plan-box").css('transform','scale(1.00)');
    	$(".midrange-plan-box").css('opacity','0.5');
	});

	$('#pricing').click(function(){
		$(".budget-plan-box").css('opacity','1');
		$(".midrange-plan-box").css('opacity','1');
		$(".luxury-plan-box").css('opacity','1');
		$(".budget-plan-box").css('transform','scale(1.00)');
		$(".midrange-plan-box").css('transform','scale(1.00)');
		$(".luxury-plan-box").css('transform','scale(1.00)');
	});


	//using _underscore
	// infoBoxes = [$("#info-box1"), $("#info-box2"), $("#info-box3")]

	// _.each(infoBoxes, function(element, index) {
	// 	var pricingBoxes = [$(".budget-plan-box"), $(".midrange-plan-box"), $(".luxury-plan-box")]

	// 	element.click(function() {
	// 		var clickedIndex = infoBoxes.indexOf(element)

	// 		pricingBoxes[clickedIndex].css('transform', 'scale(1.02)')
	// 		pricingBoxes[clickedIndex].css('opacity', '1')

	// 		var clickedPlanBox = pricingBoxes.slice(0).splice(clickedIndex, 1)
	// 		pricingBoxes.splice(clickedIndex, 1)

	// 		_.each(pricingBoxes, function(el) {
	// 			el.css('transform', 'scale(1.0)')
	// 			el.css('opacity', '0.5')
	// 	})
	// 	})
	// })

});
