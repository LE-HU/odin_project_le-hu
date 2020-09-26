# BST
# arr = Array.new(21).map { |x| x = rand(100) }.uniq.sort
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
  attr_accessor :root

  def initialize(arr)
    @arr = arr
  end

  def build_tree(arr = @arr)
    return if arr.size == 1

    mid = arr.size / 2
    root = Node.new(arr[mid])

    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid..-1])
    @root = root
    return root
  end

  def insert(val, root = @root)
    if root.nil?
      return @root = Node.new(val)
    else
      if root.data == val
        return root
      elsif root.data < val
        root.right = insert(val, root.right)
      else
        root.left = insert(val, root.left)
      end
    end
    @root = root
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left
  end
end

x = Tree.new(arr)
x.build_tree
x.insert(20)
x.pretty_print
