# TODO: create AI
# TODO: let computer guess, you make the code

class Mastermind
  def initialize
    @decoding_board = Array.new(10, [".", ".", ".", "."])
    @code == []
    @current_guess = []
    @hint = []
    @turn = 1
  end

  def get_code
    @code = []
    4.times { @code << rand(1..6).to_s }
  end

  def display_board
    pp @decoding_board
  end

  def make_guess
    puts "-" * 22
    puts "You have #{11 - @turn} turns left"
    entry = ""
    until entry.match?(/^[1-6]{4}$/)
      puts "Please enter your pegs color 1 to 6 in XXXX format:"
      entry = gets.chomp
    end
    @current_guess = entry.scan(/(.)/).flatten
    @turn += 1
  end

  def update_board
    @decoding_board[1 - @turn] = @current_guess
  end

  def win?
    return "LOSE" if @turn == 11
    win = false
    if @current_guess == @code
      win = true
      puts "!!!!! You win !!!!!"
    end
    win
  end

  def give_hint
    # array clones to be modified while iterating original arrays.
    code_helper = @code.clone
    guess_helper = @current_guess.clone

    @code.each_with_index do |code_peg, index|
      if @current_guess[index] == code_peg
        @hint << "X"

        code_helper.delete_at(code_helper.index(code_peg))
        guess_helper.delete_at(guess_helper.index(code_peg))
      end
    end

    guess_helper.each do |peg|
      if ([peg] & code_helper).empty?
        next
      else
        @hint << "O"
      end
    end

    puts "Hint:"
    pp @hint
    @hint = []
  end

  def play
    get_code
    until win?
      display_board
      make_guess
      update_board
      puts "*" * 22
      give_hint
    end
    display_board
    puts "Code was:"
    print @code
    puts "\n--- END ---"
  end
end

x = Mastermind.new
x.play
