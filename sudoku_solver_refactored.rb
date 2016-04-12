class SudokuBoard
	attr_accessor :state

	def initialize(board_string)
		self.state = board_string.split("")
	end

	def next_blank
		state.find_index("-")
	end

	def solved?
		!next_blank
	end

	def to_s
		state.join("")
	end

	def row_values
		row = next_blank / 9
		state[row*9 .. row*9+8]
	end

	def column_values
		column = next_blank % 9
		state.select.with_index do |value, index|
			index % 9 == column
		end
	end

	def box_values
		box_num = box_number(next_blank)
		state.select.with_index do |value, index|
			box_number(index) == box_num
		end
	end

	def box_number(position)
		row = position / 27
		column = position % 9 / 3
		row * 3 + column
	end

	def possible_values
		%w{ 1 2 3 4 5 6 7 8 9 } - row_values - column_values - box_values
	end

	def solution
		return self if solved?
		new_string = self.to_s
		possible_values.each do |guess|
			new_string[next_blank] = guess
			solved_board = SudokuBoard.new(new_string).solution
			return solved_board if solved_board.solved?
		end
		self
	end

end

board_strings = ["1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--",
"--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3",
"29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9",
"-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-",
"6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--",
"---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----",
"-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--",
"-96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7",
"----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----",
"3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--",
"3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-",
"-2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-",
"--7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--",
"----------2-65-------18--4--9----6-4-3---57-------------------73------9----------",
"---------------------------------------------------------------------------------"]

board_strings.each do |board_string| 
	p board_string
	p SudokuBoard.new(board_string).solution.to_s
end


