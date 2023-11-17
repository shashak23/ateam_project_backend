$().ready(function() {
	resizeWindow()
});

$(window).resize(function() {
	resizeWindow();
});

function resizeWindow() {
	var windowWidth = $(window).width();
	var bodyWidth = 1080;
	
	var remainWidth = windowWidth - bodyWidth;
	
	$("body > .body_container > .body_left_aside").css("max-width", remainWidth / 2)
	$("body > .body_container > .body_right_aside").css("max-width", remainWidth / 2)
}