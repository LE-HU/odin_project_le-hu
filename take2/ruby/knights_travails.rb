class Node
  attr_accessor :value, :parent

  def initialize(value = [], parent = nil)
    @value = value
    @parent = parent
  end
end

class Board
  attr_accessor :paths

  def initialize(paths = [])
    @paths = paths
  end

  def valid_space?(position)
    position[0].between?(0, 7) && position[1].between?(0, 7) ? true : false
  end

  def create_moves(node)
    x = node.value.first
    y = node.value.last

    move_list = []
    move_list << Node.new([(x + 2), (y + 1)], node) if valid_space?([(x + 2), (y + 1)])
    move_list << Node.new([(x + 2), (y - 1)], node) if valid_space?([(x + 2), (y - 1)])
    move_list << Node.new([(x - 2), (y + 1)], node) if valid_space?([(x - 2), (y + 1)])
    move_list << Node.new([(x - 2), (y - 1)], node) if valid_space?([(x - 2), (y - 1)])
    move_list << Node.new([(x + 1), (y + 2)], node) if valid_space?([(x + 1), (y + 2)])
    move_list << Node.new([(x + 1), (y - 2)], node) if valid_space?([(x + 1), (y - 2)])
    move_list << Node.new([(x - 1), (y + 2)], node) if valid_space?([(x - 1), (y + 2)])
    move_list << Node.new([(x - 1), (y - 2)], node) if valid_space?([(x - 1), (y - 2)])

    move_list
  end

  def display_path(node)
    path = []
    until node.nil?
      path << node.value
      node = node.parent
    end
    @paths << path
    puts "\nYou made it in #{path.length - 1} moves! Here's the path:"
    p path.reverse
    puts "\n"
  end

  def knight_moves(start_point, end_point)
    queue = [Node.new(start_point)]
    while !queue.empty?
      current = queue.shift
      if current.value == end_point
        display_path(current)
        draw_board(@paths.last)
        break
      else
        moves = create_moves(current)
        moves.each { |move| queue << move }
      end
    end
  end

  def draw_board(path)
    for x in 0..7
      display = []
      for y in 0..7
        if path.include?([x, y])
          display << "[#{path.reverse.index([x, y]) + 1}]"
        else
          display << ["[ ]"]
        end
      end
      puts "#{x} #{display.join}\n"
    end
    puts "   0  1  2  3  4  5  6  7 "
  end
end

Board.new.knight_moves([0, 1], [3, 3])
