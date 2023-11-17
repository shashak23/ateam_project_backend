$().ready(function() {
	resizeWindow()
	console.log($("div.grid"))
	
	$("div.grid").each(function() {
		col = $(this).data("grid-col") || ""
		row = $(this).data("grid-row") || ""
		colGap = $(this).data("col-gap") || ""
		rowGap = $(this).data("row-gap") || ""
		console.log(this, col, row, colGap, rowGap)
		
		if (col.trim() != "") {
			$(this).css("grid-template-columns", col.trim())
		}
		if (row.trim() != "") {
			$(this).css("grid-template-rows", row.trim())
		}
		if (colGap.trim() != "") {
			$(this).css("column-gap", colGap.trim())
		}
		if (rowGap.trim() != "") {
			$(this).css("row-gap", rowGap.trim())
		}
	});
	
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