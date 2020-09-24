def select_word
  File.open("5desk.txt") do |f|
    words_array = f.readlines.map { |word| word.strip }

    word = nil
    loop do
      word = words_array.sample.upcase
      break if word.length.between?(5, 12)
    end
    word
  end
end

def display_board(board)
  puts "\n#{board}\n"
end

def guess_letter
  print "Enter a letter: "
  letter = gets.chomp.upcase
  guess_letter unless letter.length == 1
  letter
end

def check_for_hits(completed_board, gaming_board, letter)
  completed_board.each_with_index do |v, i|
    if v == letter
      gaming_board[i] = v
    end
  end
  gaming_board
end

def win?(board1, board2)
  if board1 == board2
    puts "CONGRATULATIONS! THE CPU SPARES YOUR LIFE TODAY."
  end
  board1 == board2
end

def lose?(counter)
  if counter == 0
    puts "PREPARE THE GALLOWS!!!"
    return true
  end
end

def ask_for_action(completed_board, gaming_board, guess_tries)
  puts "Select your action: "
  puts "1. Play"
  puts "2. Save Game"
  puts "3. Load Game"
  decision = gets.chomp
  case decision
  when "1"
    # do nothing
  when "2"
    File.open("save.txt", "w") do |file|
      file.print "#{completed_board};#{gaming_board};#{guess_tries}"
    end
    puts "GAME SAVED"
  when "3"
    File.open("save.txt", "r") do |file|
      local_array = file.read.split(";")
      completed_board = local_array[0]
      gaming_board = local_array[1]
      guess_tries = local_array[2]
      return completed_board, gaming_board, guess_tries
      # print local_array[0]
      # print local_array[1]
      # print local_array[2]
      # puts ""
      # p local_array[0]
      # p local_array[1]
      # p local_array[2]
    end
  end
end

############################## START

# TODO: clear excess puts once finished.
# TODO: implement save/load game optionpleted_board},#{gaming_board},
# TODO: implement GUESS WHOLE WORD option once player knows the answ#{completed_board},#{gaming_board},#{guess_tries}er up front.

word_to_guess = select_word

## OUR LITTLE CHEAT
puts word_to_guess

# word player needs to guess, split into separate letters
completed_board = word_to_guess.split("")
# hidden gaming board full of _ in place of letters
gaming_board = completed_board.map { |letter| letter = "_" }
# how many tries player has.
guess_tries = 13

puts "~~~~~~~~~~~~~~~~~ WELCOME TO THE HANGMAN GAME ~~~~~~~~~~~~~~~~"
puts "~~~~~~~~~~~~~ GUESS EACH LETTER OF A SECRET WORD ~~~~~~~~~~~~~"
puts "~ THE CPU HAS SELECTED A WORD FOR YOU, PREPARE TO GET HANGED ~"
puts "~~~~~~~~ YOU HAVE #{guess_tries} TRIES, GOOD LUCK, YOU'LL NEED IT ~~~~~~~~"

while true
  ask_for_action(completed_board, gaming_board, guess_tries)
  display_board(gaming_board)
  puts "You have #{guess_tries} tries left."
  check_for_hits(completed_board, gaming_board, guess_letter)
  guess_tries -= 1
  if win?(completed_board, gaming_board)
    print "SECRET WORD:"
    display_board(gaming_board)
    break
  elsif lose?(guess_tries)
    print "YOUR FINAL BOARD: "
    display_board(gaming_board)
    print "CPU SECRET WORD WAS: "
    display_board(completed_board)
    break
  end
end

# rzeczy do zapisania w savefile:
# slowo do odgadniecia, aktualny board gracza, guess tries left
# jesli cala gra byłaby instancją klasy Game, to czy wystarczyłoby zapisać ten obiekt?
