$(document).ready(function() {
	var game = new Game();
	renderGame(game.boardState);
	$("body").on("keyup", function(event){
		event.preventDefault();
		var movements = [];
		if (event.keyCode == 37) {movements = game.move("left")};
		if (event.keyCode == 38) {movements = game.move("up")};
		if (event.keyCode == 39) {movements = game.move("right")};
		if (event.keyCode == 40) {movements = game.move("down")};
		renderMovements(movements);
	});
});
