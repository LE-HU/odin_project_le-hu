require "./lib/tictactoe"

describe TicTacToe do
  tictactoe = TicTacToe.new
  describe "#initialize" do
    it "builds 9x9 board and selects starting player X/O" do
      expect(tictactoe.turn_selector).to eq("X").or eq("O")
      expect(tictactoe.instance_variable_get(:@board)).to include(".")
      expect(tictactoe.instance_variable_get(:@board).size).to eq(9)
    end
  end

  describe "#display_board" do
    it "displays board and board spot legend" do
    end
  end

  describe "player moves" do
    it "checks for valid player moves" do
      allow($stdin).to receive(:gets).and_return("0")
      spot = $stdin.gets
      tictactoe.player1_move
      expect(tictactoe.instance_variable_get(:@board[0])).to eql("X")
    end
  end
end

# expect(board[WIN_CONDITIONS[0, 0]]).to eql(["X"])
# expect(board[WIN_CONDITIONS[0, 1]]).to eql(["X"])
# expect(board[WIN_CONDITIONS[0, 2]]).to eql(["X"])
# WIN_CONDITIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
#                   [0, 3, 6], [1, 4, 7], [2, 5, 8],
#                   [0, 4, 8], [2, 4, 6]]
