$(window).load(function(){

	buildUp();
	function buildUp(){
		timer = $('#timer');
		time = timer.data('time');

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

	$('.multipleChoice').on('change', function(){
		nextStep();
	});

	function nextStep(){
		var cur_step = $('#test').find('.currentStep');
		var cur_step_nr = cur_step.data('step');

		var next_step_nr = cur_step_nr + 1;
		var next_step = $('#test').find('[data-step="'+next_step_nr+'"]');

		cur_step.removeClass('currentStep');
		next_step.addClass('currentStep');

		if(next_step_nr == 2){
			setTimeout(function(){
				nextStep();
			}, time*1000);
			timer.addClass('animate');
		}else{
			timer.removeClass('animate');
		}

		if(next_step_nr == last_step_nr){
			//AJAX SEND FORM ELEMENTS
			console.log('AJAX SEND FORM ELEMENTS');
		}
	}

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
});