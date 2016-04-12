function renderGame(boardState) {
	$("span").remove();
	boardState.forEach(function(value, index){
		if (value != "0") {
			var spanTag = "<span class='num"+value+"'>"+value+"</span>";
			$("#"+index).append(spanTag);
		};
	});
};

function renderMovements(movements){
	movements.forEach(function(movement){
		if (movement.length > 1) {
			var $spanToMove = $("#"+movement[2]).find("span");
			var $cellTarget = $("#"+movement[0]);
			var $targetSpan = $cellTarget.find("span");
			moveSpan($spanToMove, $cellTarget);
			$cellTarget.append($spanToMove);
			$targetSpan.remove();
			updateSpan($spanToMove, movement[1]);
		}

		else {
			var value = "2";
			$("#"+movement[0]).append("<span class='num"+value+"'>"+value+"</span>");
		};
	});
};

function moveSpan ($spanToMove, $cellTarget){
	var startPos = $spanToMove.offset();
	var endPos = $cellTarget.offset();
	$spanToMove.css({top: startPos.top, left: startPos.left});
	$spanToMove.animate({top: endPos.top+2, left: endPos.left+2}, 500);
}

function updateSpan ($span, value) {
	$span.text(value);
	$span.removeClass().addClass("num"+value);
};