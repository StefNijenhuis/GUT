$ ->
	$('.test').click ->
		$(this).hide()

browserSize = ->
	width = $(window).width()
	height = $(window).height()

	$('#width').html(width)
	$('#height').html(height)
	console.log(width)
	console.log(height)
browserSize()


