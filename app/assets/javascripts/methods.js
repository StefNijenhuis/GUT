$(window).load(function(){

	/* GON 1= Memory test, 2= Blur test, 3= Grayscale test, 4= ABtest, 5= Glyphtest */

	buildUp();
	function buildUp(){
		timer = $('#timer');
		time = timer.data('time');
		timeDelay = 2000;
		if (gon.methodname === 4) {
			choice = 0;
		}

		timer.css({
			'-webkit-animation-duration': time+'s',
			'animation-duration': time+'s',
		});

		last_step_nr = $('.step').length;

		$('*[data-step="1"]').addClass('currentStep');

		if (gon.methodname === 2) {
			var vague = $('.blur').Vague({
				intensity:      40,      
				forceSVGUrl:    false
			});

			vague.blur();

			vague.animate(
			  20,
			  {
			    duration:10000,
			    easing: 'linear'
			  }
			).done(function(){
			    
			});
 		} 
	}

	$('.nextButton').on('click', function(){
		nextStep();
	});

	$('.abChoice').on('click', function(){

		$('.abChoice').removeClass('selected');

		$(this).addClass('selected');
		choice = $(this).data('ab');

		setTimeout(function(){
			nextStep();
		}, timeDelay);
	});

	function startListening(){
		$(document).keydown(function(e){
		    if (e.keyCode == 37) { 
		       choice = 1;

 			   $(".abChoice").removeClass('selected');
		       $(".abcontainer").find('[data-ab="1"]').addClass('selected');

		    setTimeout(function(){
				nextStep();
			}, timeDelay);
		    }

		    if (e.keyCode == 39) { 
		       choice = 2;
 			   $(".abChoice").removeClass('selected');
		       $(".abcontainer").find('[data-ab="2"]').addClass('selected');

		    setTimeout(function(){
				nextStep();
			}, timeDelay);

		    }
		});
	}

	if (gon.methodname === 5){
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

		if(next_step_nr == 2){

			if(gon.methodname === 4){
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
			//AJAX SEND FORM ELEMENTS
			console.log(choice);
			console.log('AJAX SEND FORM ELEMENTS');
			
		}
	}

});