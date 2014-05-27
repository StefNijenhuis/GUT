$( document ).ready(function() {

	buildUp();

	function startTimer(){

		$(".timer").TimeCircles(
			{ time: {
				Days: { show: false },
				Hours: { show: false },
				Minutes: { show: false },
				Seconds: { color: "#5cb85c" }
			}},
			{count_past_zero: false}
		).addListener(function(unit, value, total) {
			if(total === 0) {
				nextStep();
				$('.nextButton').show();
				closeTest();
			}
		})
	}

 	function closeTest(){
 		$(".timer").hide();
 	}

 	function buildUp(){

 		count = 1;
 		
 		if (gon.methodname === 2) {
 			console.log("hai");
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
			    //console.log('Animation finished!');
			});
 		} 
		
 	}
 	
	$(".nextButton").click(function() {
	  	nextStep();
	});

 	function nextStep(){

 		step = $("#test").find("[data-step='" + count + "']");
 		step.hide();
 		step.next().show();
 		count ++

 		console.log(count);

 		console.log(step);

 		if(count == 2){

 			$('.nextButton').hide();
 			startTimer();
 		}
 	}
});