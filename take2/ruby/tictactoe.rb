# TODO: add draw condition if turn == 9 and no winner.

class TicTacToe
  WIN_CONDITIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                    [0, 4, 8], [2, 4, 6]]

  attr_accessor :turn_selector

  def initialize
    @turn_selector = ["X", "O"].sample
    @board = Array.new(9, ".")
  end

  def display_board
    puts "*" * 13 + " " * 13 + "*" * 13
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} " + " " * 15 + " 0 | 1 | 2 "
    puts "-" * 13 + " " * 13 + "-" * 13
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} " + " " * 15 + " 3 | 4 | 5 "
    puts "-" * 13 + " " * 13 + "-" * 13
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} " + " " * 15 + " 6 | 7 | 8 "
    puts "*" * 13 + " " * 13 + "*" * 13
  end

  def winner?
    winner = false
    WIN_CONDITIONS.each do |comb|
      if @board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X"
        puts "Player X wins!"
        winner = true
      elsif @board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O"
        puts "Player O wins!"
        winner = true
      else
        next
      end
    end
    winner
  end

  def player1_move(mark = "X")
    display_board
    return "FINISH" if winner?
    spot = ""
    until spot.match?(/[0-9]/) && @board[spot.to_i] == "."
      puts "Player X turn - please pick a free spot:"
      spot = gets.chomp
    end
    @board[spot.to_i] = mark
    player2_move
  end

  def player2_move(mark = "O")
    display_board
    return "FINISH" if winner?
    spot = ""
    until spot.match?(/[0-9]/) && @board[spot.to_i] == "."
      puts "Player O turn - please pick a free spot:"
      spot = gets.chomp
    end
    @board[spot.to_i] = mark
    player1_move
  end

  def play
    if @turn_selector == "X"
      player1_move
    else
      player2_move
    end
  end
end

TicTacToe.new.play
