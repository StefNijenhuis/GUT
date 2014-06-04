$( document ).ready(function() {

	buildUp();
	function buildUp(){
		timer = $('#timer');
		time = timer.data('time');
		choice = 0;
		timeDelay = 2000;

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

		setTimeout(function(){
			nextStep();
		}, timeDelay);
	});

	function nextStep(){
		var cur_step = $('#test').find('.currentStep');
		var cur_step_nr = cur_step.data('step');

		var next_step_nr = cur_step_nr + 1;
		var next_step = $('#test').find('[data-step="'+next_step_nr+'"]');

		cur_step.removeClass('currentStep');
		next_step.addClass('currentStep');

		if(next_step_nr == 2){

			startListening();

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