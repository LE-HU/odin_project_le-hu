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
    until q.empty?
      current = q.shift
      print "#{current.data}, "
      q << current.left unless current.left.nil?
      q << current.right unless current.right.nil?
    end
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
# x.insert(9)
# pp x.find(10)
# pp x.find(25)
x.pretty_print
x.breadth_traversal
# x.preorder_traversal
# puts "***"
# x.postorder_traversal
# x.inorder_traversal
# puts "***"
# print x.node_height(x.find(20))
# puts ""
# puts "***"
# print x.node_depth(x.find(20))
# puts ""
# puts "***"
# print x.node_depth(x.find(9))
# puts ""

# puts "*************"

# x.delete_node(10)
# x.delete_node(3)
# x.pretty_print

# y = Tree.new(Array.new)
# y.build_tree
# y.insert(5)
# y.pretty_print
