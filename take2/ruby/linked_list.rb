# Linked List

# You will need two classes:

#     LinkedList class, which will represent the full list.
#     Node class, containing a #value method and a link to the #next_node, set both as nil by default.

# Build the following methods in your linked list class:

#     #append(value) adds a new node containing value to the end of the list
#     #prepend(value) adds a new node containing value to the start of the list
#     #size returns the total number of nodes in the list
#     #head returns the first node in the list
#     #tail returns the last node in the list
#     #at(index) returns the node at the given index
#     #pop removes the last element from the list
#     #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#     #find(value) returns the index of the node containing value, or nil if not found.
#     #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

# Extra Credit

#     #insert_at(value, index) that inserts the node with the provided value at the given index
#     #remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)

# head / tail
# at index

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = @head
      @tail = node
    end
  end

  def prepend(node)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  # why this doesn't work omg
  def size
    counter = 0
    until @head.nil?
      @head = @head.next_node
      counter += 1
    end
    counter
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
  end

  def pop
    return nil if @head.nil?
    # node =
  end

  # def unshift
  #   return nil if @head.nil?
  #   node = @head
  #   @head = @head.next_node
  #   return node
  # end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

x = LinkedList.new
x.append(Node.new("abc"))
x.append(Node.new("123"))
x.append(Node.new("q2w3e4"))
pp x

puts "*******"

# x.unshift
# x.unshift
pp x

# pp x.size
