require "./lib/tictactoe"

require "stringio"

describe TicTacToe do
  before do
    allow($stdout).to receive(:write)
  end
  describe "#initialize" do
    it "initializes with 9x9 board and randomly selects starting player X/O" do
      tictactoe = TicTacToe.new
      expect(tictactoe.turn_selector).to eq("X").or eq("O")
      expect(get_board(tictactoe)).to include(".")
      expect(get_board(tictactoe).size).to eq(9)
    end
  end

  describe "#display_board" do
    it "displays board and board spot legend" do
    end
  end

  describe "player moves" do
    it "checks for valid player1 moves" do
      tictactoe = TicTacToe.new
      allow(tictactoe).to receive(:gets).and_return("1\n")
      tictactoe.player1_move
      board = get_board(tictactoe)
      expect(board[1]).to eql("X")
    end
    it "checks for valid player1 moves" do
      tictactoe = TicTacToe.new
      allow(tictactoe).to receive(:gets).and_return("0\n")
      tictactoe.player2_move
      board = get_board(tictactoe)
      expect(board[0]).to eql("O")
    end
    # it "checks for invalid player1 input" do
    #   tictactoe = TicTacToe.new
    #   allow(tictactoe).to receive(:gets).and_return("\n")
    #   tictactoe.player1_move
    #   board = get_board(tictactoe)
    #   expect(board[1]).to eql(".")
    # end
  end

  describe "#winner?" do
    it "checks for win conditions case - horizontal first line" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[0] = tictactoe.turn_selector
      board[1] = tictactoe.turn_selector
      board[2] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - horizontal second line" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[3] = tictactoe.turn_selector
      board[4] = tictactoe.turn_selector
      board[5] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - horizontal third line" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[6] = tictactoe.turn_selector
      board[7] = tictactoe.turn_selector
      board[8] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - diagonal top-down" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[0] = tictactoe.turn_selector
      board[4] = tictactoe.turn_selector
      board[8] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - diagonal bottom-up" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[0] = tictactoe.turn_selector
      board[4] = tictactoe.turn_selector
      board[8] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - vertical first line" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[0] = tictactoe.turn_selector
      board[3] = tictactoe.turn_selector
      board[6] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - vertical second line" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[1] = tictactoe.turn_selector
      board[4] = tictactoe.turn_selector
      board[7] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
    it "checks for win conditions case - vertical third line" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board[2] = tictactoe.turn_selector
      board[5] = tictactoe.turn_selector
      board[8] = tictactoe.turn_selector
      expect(tictactoe.winner?).to be true
    end
  end

  describe "#draw?" do
    it "checks for a draw when player marks occupy all board spaces" do
      tictactoe = TicTacToe.new
      board = get_board(tictactoe)
      board.map! { |spox| spot = tictactoe.turn_selector }
      expect(tictactoe.draw?).to be true
    end
  end

  def get_board(instance)
    board = instance.instance_variable_get(:@board)
  end
end
