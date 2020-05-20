class Board
  attr_accessor :play_area

  def initialize()
    @play_area = Array.new(3) { Array.new(3, nil) }
  end
end

x = Board.new

print x.play_area
