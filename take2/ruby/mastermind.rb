# GET CODE
# code = rand(1111..6666)

# can work on strings for easy comparison "1234" can be checked
# with str[0,]1, str[1,2] and so on.
# although we can operate on arrays of integers too.

# match 4 digits regex /^d{4}$/

class Mastermind
  attr_accessor :decoding_board, :turn
  PEGS = [1, 2, 3, 4, 5, 6]

  def initialize
    @decoding_board = Array.new(10, [".", ".", ".", "."])
    @code == nil
    @current_guess = nil
    @turn = 1
  end

  def get_code
    @code = rand(1111..6666).to_s.scan(/(.)/).flatten
  end

  def display_board
    pp @decoding_board
  end

  def make_guess
    puts "You have #{11 - @turn} turns left"
    puts "Please enter your pegs in XXXX format:"
    @current_guess = gets.chomp.scan(/(.)/)
    @turn += 1
    # print @current_guess
  end

  def update_board
    @decoding_board[1 - @turn] = @current_guess.flatten
  end

  def get_feedback
    win?
    give_hint
  end

  def win?
    return "LOSE" if turn == 11
    win = false
    if @current_guess == @code
      puts "You have won!"
      win = true
    end

    return "WIN" # if pegs match the code
  end

  def give_hint
  end
end

print Mastermind.new.get_code
puts ""
Mastermind.new.display_board
puts ""
# Mastermind.new.make_guess
x = Mastermind.new
x.make_guess
x.update_board
x.display_board
