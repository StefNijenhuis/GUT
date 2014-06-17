$(window).load(function(){

	/* GON 1= Memory test, 2= Blur test, 3= Grayscale test, 4= ABtest, 5= Glyphtest */
	buildUp();

	function buildUp(){
		timer = $('#timer');
		time = timer.data('time');
		timeDelay = 2000;
		data = {};
		var ip;

		if (gon.method_id === 4) {
			choice = 0;
		}

		timer.css({
			'-webkit-animation-duration': time+'s',
			'animation-duration': time+'s',
		});

		last_step_nr = $('.step').length;

		$('*[data-step="1"]').addClass('currentStep');

	}

	$('.nextButton').on('click', function(){
		nextStep();
	});

	$('.abChoice').on('click', function(){

		$('.abChoice').removeClass('selected');

		$(this).addClass('selected');
		choice = $(this).data('ab');
	});

	function startListening(){
		$(document).keydown(function(e){
		    if (e.keyCode == 37) { 
		       choice = 1;

 			   $(".abChoice").removeClass('selected');
		       $(".abcontainer").find('[data-ab="1"]').addClass('selected');

		    }

		    if (e.keyCode == 39) { 
		       choice = 2;
 			   $(".abChoice").removeClass('selected');
		       $(".abcontainer").find('[data-ab="2"]').addClass('selected');
		    }
		});
	}

	if (gon.method_id === 5){
		//set height for iFrame
		iFrameHeight();

		$(window).resize(function(){
			iFrameHeight();
		});

	 	function iFrameHeight(){
	 		var timer_height = timer.height();
	 		var header_height = $('header').height();
	 		var window_height = window.innerHeight;
	 		var iframe_height = window_height - (header_height+timer_height);

	 		$('iframe').css('height',iframe_height-5);
	 	}
 	}
	
	function nextStep(){
		var cur_step = $('#test').find('.currentStep');
		var cur_step_nr = cur_step.data('step');

		var next_step_nr = cur_step_nr + 1;
		var next_step = $('#test').find('[data-step="'+next_step_nr+'"]');

		cur_step.removeClass('currentStep');
		next_step.addClass('currentStep');


		if (gon.method_id === 2 && cur_step_nr == 1) {
			var vague = $('.blur').Vague({
				intensity:      40,      
				forceSVGUrl:    false
			});

			vague.blur();

			vague.animate(
			  10,
			  {
			    duration:10000,
			    easing: 'linear'
			  }
			).done(function(){
			    
			});
 		} 


		if(next_step_nr == 2){

			if(gon.method_id === 4){
				startListening();
			}

			setTimeout(function(){
				nextStep();
			}, time*1000);
			timer.addClass('animate');
		}else{
			timer.removeClass('animate');
		}

		if(next_step_nr == last_step_nr){
			
		}
	}

	function sendData(){
		// get ip
		$.ajax({
			dataType: "json",
			url: "http://jsonip.appspot.com?callback=?",
			async : false,
			success: function(data){
				ip = data.ip;

				buildUpData(ip);
			}
		});	

		// prepare data for ajax post
		function buildUpData(ip){

			// get resolution
			height 	= screen.height; 
			width 	= screen.width;

			// get browser
			var browser, sUsrAg = navigator.userAgent;

			if(sUsrAg.indexOf("Chrome") > -1) {
			    browser = "Google Chrome";
			} else if (sUsrAg.indexOf("Safari") > -1) {
			    browser = "Apple Safari";
			} else if (sUsrAg.indexOf("Opera") > -1) {
			    browser = "Opera";
			} else if (sUsrAg.indexOf("Firefox") > -1) {
			    browser = "Mozilla Firefox";
			} else if (sUsrAg.indexOf("MSIE") > -1) {
			    browser = "Microsoft Internet Explorer";
			}

			data = {
				'browser'		: browser,
				'width'			: width,
				'height'		: height,
				'ip' 			: ip,
				'usertest_id' 	: gon.usertest_id
			};

			$.ajax({
				type: "POST",
				url: "/testpeople",
				data: { testperson_params: data },
				success: function(response) {
					$('#result_testperson_id').val(response.id);
				}
			});				
		}
	}

	sendData();

});