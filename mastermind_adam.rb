class Mastermind
  require "set"

  def initialize
    colors = "123456".chars
    @all_answers = colors.product(*[colors] * 3).map(&:join)
    @all_scores = Hash.new { |h, k| h[k] = {} }

    @all_answers.product(@all_answers).each do |guess, answer|
      @all_scores[guess][answer] = calculate_score(guess, answer)
    end

    @all_answers = @all_answers.to_set
  end

  def play
    @guesses = 0
    @answer = 4.times.map { "123456".chars.sample }.join
    @possible_scores = @all_scores.dup
    @possible_answers = @all_answers.dup

    while @guesses < 10
      @guess = make_guess
      if @all_answers.include?(@guess)
        @guesses += 1
        @score = calculate_score(@guess, @answer)
        if @score == "BBBB"
          p [@guesses, @guess]
          break
        end
      end
    end
  end

  def calculate_score(guess, answer)
    score = ""
    wrong_guess_pegs, wrong_answer_pegs = [], []
    peg_pairs = guess.chars.zip(answer.chars)

    peg_pairs.each do |guess_peg, answer_peg|
      if guess_peg == answer_peg
        score << "B"
      else
        wrong_guess_pegs << guess_peg
        wrong_answer_pegs << answer_peg
      end
    end
    wrong_guess_pegs.each do |peg|
      if wrong_answer_pegs.include?(peg)
        wrong_answer_pegs.delete(peg)
        score << "W"
      end
    end
  end

  def make_guess
    if @guesses > 0
      puts "Score: #{@score}"
    else
      puts
    end

    puts "Guesses Remaining: #{10 - @guesses}"
    print "Guess: "
    gets.chomp
  end
end

Game = Mastermind.new
Game.play
