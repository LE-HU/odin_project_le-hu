# BST
arr = Array.new(21).map { |x| x = rand(100) }.uniq.sort
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

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
    return if arr.size <= 1

    mid = arr.size / 2
    root = Node.new(arr[mid])

    root.left = build_tree(arr[0...mid])
    root.right = build_tree(arr[mid..-1])

    @root = root
    return root
  end

  def find(val, root = @root)
    return "No such value" if root.nil?
    if val == root.data
      return root
    elsif val > root.data
      find(val, root.right)
    else
      find(val, root.left)
    end
  end

  def node_height(node, root = @root)
    return 0 if node.nil?

    left_side = node_height(node.left)
    right_side = node_height(node.right)

    left_side > right_side ? left_side + 1 : right_side + 1
  end

  def node_depth(node, root = @root, depth = 1)
    if root == nil || root.data == node.data
      return depth
    elsif root.data < node.data
      depth += 1
      node_depth(node, root.right, depth)
    else
      depth += 1
      node_depth(node, root.left, depth)
    end
  end

  def min_value(node)
    current = node

    until current.left.nil?
      current = current.left
    end

    return current
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

  def delete_node(val, root = @root)
    return root if root.nil?
    if val < root.data
      root.left = delete_node(val, root.left)
    elsif val > root.data
      root.right = delete_node(val, root.right)
    else
      if root.left.nil?
        root = root.right
        return root
      elsif root.right.nil?
        root = root.left
        return root
      else
        temp = min_value(root.right)
        root.data = temp.data
        root.right = delete_node(temp.data, root.right)
      end
    end
    root
  end

  def inorder_traversal(root = @root)
    return if root.nil?
    inorder_traversal(root.left)
    print "#{root.data}, "
    inorder_traversal(root.right)
  end

  def preorder_traversal(root = @root)
    return if root.nil?
    print "#{root.data}, "
    preorder_traversal(root.left)
    preorder_traversal(root.right)
  end

  def postorder_traversal(root = @root)
    return if root.nil?
    postorder_traversal(root.left)
    postorder_traversal(root.right)
    print "#{root.data}, "
  end

  def breadth_traversal(root = @root)
    return if root.nil?
    q = []
    q << root
    result = []
    until q.empty?
      current = q.shift
      print "#{current.data}, "
      result << current.data
      q << current.left unless current.left.nil?
      q << current.right unless current.right.nil?
    end
    result
  end

  def balanced?(node = @root)
    return 0 if node.nil?

    left_side = node_height(node.left)
    right_side = node_height(node.right)

    difference = left_side - right_side
    puts (difference.abs < 2)
    difference.abs < 2
  end

  def rebalance
    leveled_array = breadth_traversal
    @root = build_tree(leveled_array)
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left
  end
end

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
x = Tree.new(arr)
x.build_tree
puts "Tree built."
# 2. Confirm that the tree is balanced by calling `#balanced?`
puts "Is balanced?"
x.balanced?
# 3. Print out all elements in level, pre, post, and in order
puts "Level, pre-, post-, in-order traversal output:"
x.breadth_traversal
puts ""
x.preorder_traversal
puts ""
x.postorder_traversal
puts ""
x.inorder_traversal
puts ""
# 4. try to unbalance the tree by adding several numbers > 100
puts "Inserting 101,102,103"
x.insert(101)
x.insert(102)
x.insert(103)
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
puts "Is balanced?"
x.balanced?
# 6. Balance the tree by calling `#rebalance`
puts "Calling #rebalance"
x.rebalance
puts ""
# 7. Confirm that the tree is balanced by calling `#balanced?`
puts "Is balanced?"
x.balanced?
# 8. Print out all elements in level, pre, post, and in order
x.pretty_print
