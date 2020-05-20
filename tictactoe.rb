puts "Welcome to TicTacToe game!"
puts "Player1 begins by selecting a spot for his 'X'."
puts "Alternates with Player2, who uses 'O' - first one to get 3 in a row wins."

masterboard = [1, 2, 3, 4, 5, 6, 7, 8, 9]
$player1 = "X"
$player2 = "O"
$turn = 0

def display_board(board)
  puts ""
  puts "  #{board[0]}  |  #{board[1]}  |  #{board[2]}  "
  puts separator = "-----------------"
  puts "  #{board[3]}  |  #{board[4]}  |  #{board[5]}  "
  puts separator
  puts "  #{board[6]}  |  #{board[7]}  |  #{board[8]}  "
  puts ""
  make_move(board, define_player, ask_for_position)
end

def ask_for_position
  gets.strip.to_i - 1
end

def define_player
  current_mark = $turn.even? ? $player1 : $player2
  print "Pick #{current_mark} position: "
  current_mark
end

def make_move(board, player, position) # add third argument - validity
  board[position] = player
  $turn += 1
  display_board(board)
end

########################################
display_board(masterboard)

# make_move(masterboard, define_player, ask_for_position)
# puts ""
