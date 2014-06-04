// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require RRSSB

/* GON 1= Memory test, 2= Blur test, 3= Grayscale test, 4= ABtest, 5= Glyphtest */

$( document ).ready(function() {
	/* als de checkbox veranderd */
	$( "#usertest_methodname" ).change(function() {
		method = $("#usertest_methodname").val();

		if(method){
			if(method == 5){
				$('.glyphtest').show(1000);
				$('.singleImage').hide();
			}

			if(method == 1 || method == 2 || method == 3){
				$('.glyphtest').hide();
				$('.singleImage').show(1000);
			}

			if(method == 4){
				$('.glyphtest').hide();
				$('.singleImage').hide();
			}

		}
	});
});


