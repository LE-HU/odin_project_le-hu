class Hangman
  @@current_game

  def get_word
    @word = ""
    word_file = File.read "5desk.txt"
    until @word.length >= 5 && @word.length <= 12
      @word = word_file.split.sample.strip.downcase
    end
    @hidden_word = Array.new(@word.length, "_")
  end

  def set_turns
    @turns = @word.size + 3
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
    puts ""
  end

  def get_input_and_compare
    player_input = ""
    until player_input.match?(/^[a-zA-Z1-3]{1}$/)
      puts "1 - Start New Game // 2 - Save Game // 3 - Load Game"
      print "Please choose menu selection or enter a letter: "
      player_input = gets.chomp
      if player_input.match(/^[1-3]{1}$/)
        menu(player_input)
      else
        letter = player_input.downcase
        @word.split("").each_with_index do |c, i|
          @hidden_word[i] = c if c == letter
        end
      end
    end
  end

  def menu(choice = "")
    if choice == ""
      until choice.match(/^[1-3]{1}$/)
        puts "1 - Start New Game // 2 - Save Game // 3 - Load Game"
        choice = gets.chomp
      end
    end

    case choice.to_i
    when 1
      @@current_game = Hangman.new
      @@current_game.start_game
    when 2
      save_game
    when 3
      if File.exist? "./hangman_save"
        File.open("./hangman_save", "r") do |file|
          @@current_game = Marshal.load(file.read)
          @@current_game.play
        end
      end
    else
      return
    end
  end

  def save_game
    File.open("./hangman_save", "w") { |f| Marshal.dump(self, f) }
    exit
  end

  def load_game
  end

  def play
    until win?
      display_board
      display_turns
      get_input_and_compare
      @turns -= 1
    end
  end

  def start_game
    puts "Welcome to the Hangman game!"

    get_word
    set_turns

    play

    display_board
  end
end

Hangman.new.menu
