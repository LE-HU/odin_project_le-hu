puts "Welcome to TicTacToe game!"
puts "Player1 begins by selecting a spot for his 'X'."
puts "Alternates with Player2, who uses 'O' - first one to get 3 in a row wins."

masterboard = [1, 2, 3, 4, 5, 6, 7, 8, 9]
$available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
$player1 = "X"
$player2 = "O"
$turn = 0

WIN_COMBINATIONS = [
  [0, 1, 2], # top_row
  [3, 4, 5], # middle_row
  [6, 7, 8], # bottom_row
  [0, 3, 6], # left_column
  [1, 4, 7], # center_column
  [2, 5, 8], # right_column
  [0, 4, 8], # left_diagonal
  [6, 4, 2], # right_diagonal
]

def display_board(board)
  puts ""
  puts "  #{board[0]}  |  #{board[1]}  |  #{board[2]}  "
  puts separator = "-----------------"
  puts "  #{board[3]}  |  #{board[4]}  |  #{board[5]}  "
  puts separator
  puts "  #{board[6]}  |  #{board[7]}  |  #{board[8]}  "
  puts ""
  if $turn == 9
    puts "We've got a DRAW, try again!"
    return nil
  elsif won?(board)
    puts "Someone WON, congratulations!"
    return nil
  end
  make_move(board, define_player, ask_for_position)
end

def ask_for_position
  user_input = gets.strip.to_i
  if $available_moves.include?(user_input)
    $available_moves.delete(user_input)
    return user_input
  else
    puts "C'mon, pick a valid spot!"
    ask_for_position
  end
end

def define_player
  current_mark = $turn.even? ? $player1 : $player2
  print "Pick #{current_mark} position: "
  current_mark
end

def make_move(board, player, position) # add third argument - validity
  board[position - 1] = player
  $turn += 1
  display_board(board)
end

def won?(board)
  winner = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1, win_index_2, win_index_3 = win_combination
    # checks if 3 marks at specified indices are the same
    if board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3]
      winner = true
    end
  end
  winner
end

########################################
display_board(masterboard)
