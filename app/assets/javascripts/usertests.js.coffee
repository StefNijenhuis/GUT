$ ->

	os = window.navigator.platform
	browser = "chrome"

	$('.test').click ->
		$.ajax({
	      type: "POST",
	      url: "/usertests",
	      data: { userdata: { name: browser, os: os } },
	      success:(data) ->
	        alert data.id
	        return false
	      error:(data) ->
	        return false
	    })