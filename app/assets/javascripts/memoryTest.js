
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
				closeTest();
			}
		})
	}

 	function closeTest(){
 		$(".timer").hide();
 	}

 	function buildUp(){

 		count = 1;

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
 			startTimer();
 		}
 	}
});