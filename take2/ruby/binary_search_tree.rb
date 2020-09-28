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
        # temp = root.right
        # root = nil
        # return temp
        root = root.right
        return root
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
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
# x.inorder_traversal

# puts "*************"

# x.delete_node(10)
# x.delete_node(3)
# x.pretty_print

# y = Tree.new(Array.new)
# y.build_tree
# y.insert(5)
# y.pretty_print
