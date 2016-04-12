function Game(boardState){
	this.boardState = (boardState || "0000000000000000").split('');

	this.emptySpots = function(){
		var emptySpots = [];
		this.boardState.forEach(function(value, index){
			if (value == "0") {emptySpots.push(index);}
		});
		return emptySpots;
	};

	this.addNewPiece = function(){
		var newPosition = this.emptySpots()[Math.floor(Math.random() * this.emptySpots().length)];
		this.boardState[newPosition] = "2";
		return [newPosition];
	};
	this.addNewPiece();
	
	this.toString = function() {
		return this.boardState.slice(0,4).join('')+"\n"+this.boardState.slice(4,8).join('')+"\n"+this.boardState.slice(8,12).join('')+"\n"+this.boardState.slice(12,16).join('');
	};

	this.move = function(direction){
		var movements = [];
		this.boardState.forEach(function(_, rawIndex){
			var position = ((["down", "right"].includes(direction)) ? this.boardState.length - (rawIndex+1) : rawIndex)
			var movement = this.movePiece(position, direction);
			if (movement) {movements.push(movement)};
		}, this);
		if (!_.isEqual(movements,[])) {movements.push(this.addNewPiece())};
		return movements;
	};

	this.movePiece = function (curPos, direction){
		var movement;
		var curValue = this.boardState[curPos];
		if (curValue == "0") {return undefined};
		var newPos = this.newPosition(curPos, direction);
		var newValue = curValue;
		if (newPos != curPos) {
			if (this.boardState[newPos] == curValue) {newValue = (curValue * 2).toString();};
			this.boardState[curPos] = "0";
			this.boardState[newPos] = newValue;
			return [newPos, newValue, curPos];
		};
	};

	this.newPosition = function (curPos, direction){
		var positions = this.getPositions(curPos, direction);
		var blockPos = positions.findIndex(function(newPos){
			return (this.boardState[newPos] != "0" && this.boardState[newPos] != this.boardState[curPos]);
		}, this);
		return ((blockPos == -1) ? positions[positions.length - 1] : positions[blockPos - 1]);
	};

	// Return indiced in correct row/col and direction
	this.getPositions = function(curPos, direction){
		var positions = [];
		this.boardState.forEach(function(_, newPos){
			if (this.inVector(curPos, newPos, direction)) {positions.push(newPos);};
		}, this);
		if (["left", "up"].includes(direction)) {return positions.reverse();};
		return positions;
	};

	this.inVector = function(curPos, newPos, direction){
		var rowDiff = Math.floor(curPos / 4) - Math.floor(newPos/ 4);
		var colDiff = (curPos % 4) - (newPos % 4);
		if (direction == "up" && colDiff == 0 && rowDiff >= 0) {return true}
		else if (direction == "down" && colDiff == 0 && rowDiff <= 0) {return true}
		else if (direction == "left" && rowDiff == 0 && colDiff >= 0) {return true}
		else if (direction == "right" && rowDiff == 0 && colDiff <= 0) {return true}
		else {return false};
	};
};
