class Hangman
  def initialize
    @word = ""
    @hidden_word = []
    @turns = 100
  end

  def get_word
    word_file = File.read "5desk.txt"
    until @word.length >= 5 && @word.length <= 12
      @word = word_file.split.sample.strip.downcase
    end
    @hidden_word = Array.new(@word.length, "_")
    @turns = @word.size + 1
  end

  def display_board
    pp @hidden_word
  end

  def win?
    winner = false
    unless @hidden_word.include?("_")
      puts "~~~ You win! ~~~"
      puts "The hidden word - " + @word
      winner = true
    end
    if @turns == 0
      puts "Better luck next time!"
      puts "The hidden word - " + @word
      return "LOSE"
    end
    winner
  end

  def display_turns
    puts "You have #{@turns} %s left." % (@turns > 1 ? "turns" : "turn")
  end

  def get_input_and_compare
    letter = ""
    until letter.match?(/^[a-zA-Z]{1}$/)
      puts "Please choose a letter:"
      letter = gets.chomp.downcase
    end
    @word.split("").each_with_index do |c, i|
      if c == letter
        @hidden_word[i] = c
      end
    end
  end

  def play
    puts "Welcome to the Hangman game!"
    get_word

    until win?
      display_board
      display_turns
      get_input_and_compare

      @turns -= 1
    end
    display_board
  end
end

Hangman.new.play
