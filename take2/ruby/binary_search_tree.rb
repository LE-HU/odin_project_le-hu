# BST
arr = Array.new(21).map { |x| x = rand(100) }

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

def bst(arr)
  return if arr.size == 1

  mid = arr.size / 2

  root = Node.new(arr[mid])

  root.left = bst(arr[0...mid])
  root.right = bst(arr[mid..-1])
  return root
end

pp bst(arr)
