class TicTacToe
  def initialize(board)
    @board = board
  end

  def play
    n = 0
    while n < 4 # 4 moves for now
      n += 1

      def display_board(board)
        puts "  #{board[0]}  |  #{board[1]}  |  #{board[2]}  "
        puts separator = "-----------------"
        puts "  #{board[3]}  |  #{board[4]}  |  #{board[5]}  "
        puts separator
        puts "  #{board[6]}  |  #{board[7]}  |  #{board[8]}  "
      end
    end
  end
end

class Board
  attr_accessor :play_area

  def initialize()
    @play_area = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def make_move(player, spot)
  end
end

player1 = "X"
player2 = "O"

########################################
x = Board.new

x.play_area[0] = player1
x.play_area[4] = player2

puts ""
print x.play_area
puts ""
puts ""
x.display_board
puts ""
