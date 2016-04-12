# From sudoku.rb
#Takes a board as a string in the format
#you see in the puzzle file. Returns
#something representing a board after
#your solver has tried to solve it.
def solve(board_string)
  # Get location of empty cell
  position = board_string.index("-")
  return board_string if position == nil
  # Figure out which potential numbers can go into empty cell
  possible_numbers = checker(position, board_string)
  # For each potential number...
  possible_numbers.each do |number|
  #   Fill in current cell with potential number
    board_string[position] = number.to_s
  #   Call solve method on that modified board
    puts pretty_board(board_string)
    sleep(0.01)
    output = solve(board_string)
  #   If board is solved, return solved board
    return output if solved?(output)
  end
  board_string[position] = "-"
  return board_string
end

#Returns a boolean indicating whether
#or not the provided board is solved.
#The provided board will be in whatever
#form `solve` returns.
def solved?(board)
  if board.include?("-")
    false
  else true
  end
end

#Takes in a board in some form and
#returns a string that's well formatted
#for output to the screen. No `puts` here!
#The provided board will be in whatever
#form `solve` returns.
def pretty_board(board)
  pretty_board_string = ""
  board.split("").each_slice(9).with_index do |row, index|
    pretty_row = []

    if(index > 0 && index % 3 == 0)
      pretty_board_string << "- - - | - - - | - - -\n"
    end

    row.each_slice(3) do |chunk|
      pretty_row << chunk.join(" ")
    end

    pretty_board_string << pretty_row.join(" | ")
    pretty_board_string << "\n"
  end
  puts "Solved!"
end

#Takes in a board in some form and
#returns a string in the same format
#as you see in the puzzle file.
#The provided board will be in whatever
#form `solve` returns.
def board_to_string(board)
  board
end



def checker(position, board)
  potential_numbers = %w{ 1 2 3 4 5 6 7 8 9 }
  unwanted_numbers = (current_row(position, board)+current_column(position, board)+current_box(position, board)).split("").uniq!
  potential_numbers = potential_numbers - unwanted_numbers
  potential_numbers
  return potential_numbers
  # compare numbers in current returned row, column, and box. concat those numbers into a string
  # then compare the concat string to 1..9 array
end

def current_row(position, board)
  case position
    when (0..8)
      row = board.slice(0..8)
    when (9..17)
      row = board.slice(9..17)
    when (18..26)
      row = board.slice(18..26)
    when (27..35)
      row = board.slice(27..35)
    when (36..44)
      row = board.slice(36..44)
    when (45..53)
      row = board.slice(45..53)
    when (54..62)
      row = board.slice(54..62)
    when (63..71)
      row = board.slice(63..71)
    when (72..80)
      row = board.slice(72..80)
  end
end

def current_column(position, board)
  col = position % 9
  case col
    when 0
      return board[0] + board[9] + board[18] + board[27] + board[36] + board[45] + board[54] + board[63] + board[72]
    when 1
      return board[1] + board[10] + board[19] + board[28] + board[37] + board[46] + board[55] + board[64] + board[73]
    when 2
      return board[2] + board[11] + board[20] + board[29] + board[38] + board[47] + board[56] + board[65] + board[74]
    when 3
      return board[3] + board[12] + board[21] + board[30] + board[39] + board[48] + board[57] + board[66] + board[75]
    when 4
      return board[4] + board[13] + board[22] + board[31] + board[40] + board[49] + board[58] + board[67] + board[76]
    when 5
      return board[5] + board[14] + board[23] + board[32] + board[41] + board[50] + board[59] + board[68] + board[77]
    when 6
      return board[6] + board[15] + board[24] + board[33] + board[42] + board[51] + board[60] + board[69] + board[78]
    when 7
      return board[7] + board[16] + board[25] + board[34] + board[43] + board[52] + board[61] + board[70] + board[79]
    when 8
      return board[8] + board[17] + board[26] + board[35] + board[44] + board[53] + board[62] + board[71] + board[80]
  end
end

def current_box(position, board)
  case
  when [0,1,2,9,10,11,18,19,20].include?(position)
    return board[0] + board[1] + board[2] + board[9] + board[10] + board[11] + board[18] + board[19] + board[20]
  when [3,4,5,12,13,14,21,22,23].include?(position)
    return board[3] + board[4] + board[5] + board[12] + board[13] + board[14] + board[21] + board[22] + board[23]
  when [6,7,8,15,16,17,24,25,26].include?(position)
    return board[6] + board[7] + board[8] + board[15] + board[16] + board[17] + board[24] + board[25] + board[26]
  when [27,28,29,36,37,38,45,46,47].include?(position)
    return board[27] + board[28] + board[29] + board[36] + board[37] + board[38] + board[45] + board[46] + board[47]
  when [30,31,32,39,40,41,48,49,50].include?(position)
    return board[30] + board[31] + board[32] + board[39] + board[40] + board[41] + board[48] + board[49] + board[50]
  when [33,34,35,42,43,44,51,52,53].include?(position)
    return board[33] + board[34] + board[35] + board[42] + board[43] + board[44] + board[51] + board[52] + board[53]
  when [54,55,56,63,64,65,72,73,74].include?(position)
    return board[54] + board[55] + board[56] + board[63] + board[64] + board[65] + board[72] + board[73] + board[74]
  when [57,58,59,66,67,68,75,76,77].include?(position)
    return board[57] + board[58] + board[59] + board[66] + board[67] + board[68] + board[75] + board[76] + board[77]
  when [60,61,62,69,70,71,78,79,80].include?(position)
    return board[60] + board[61] + board[62] + board[69] + board[70] + board[71] + board[78] + board[79] + board[80]
  end
end


def purple_rain(prince)
  puts "Do you want to release the purple rain?"
  answer = gets.chomp
  if answer == "y" || answer == "yes"
    prince.gsub!(/\d/, "Ƭ̵̬̊")
  else puts "lame"
  end
end

#Read the first puzzle
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

#Run the board solver and get a board back
board_strings.each do |board_string| 
  solved_board = solve(board_string)
  #Print a pretty version of the board to the screen
  puts pretty_board(solved_board)
  #Print whether or not we succeeded
  if solved?(solved_board)
    puts "Board solved!"
  else
    puts "Board is not solvable!"
  end
end


