# Ruby's own linked list

class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    #append(value) adds a new node containing value to the end of the list
    if @head.nil?
      @head = value
      @tail = value
    else
      @tail.next = value
      @tail = value
    end
  end

  def prepend(value)
    #prepend(value) adds a new node containing value to the start of the list
    if @head.nil?
      @head = value
      @tail = value
    else
      value.next = @head
      @head = value
    end
  end

  def size
    #size returns the total number of nodes in the list
    if @head && @tail
      node = @head
      counter = 1
      while node.next != nil
        counter += 1
        node = node.next
      end
      return counter
    elsif @head
      counter = 1
    else
      counter = 0
    end
  end

  def head
    #head returns the first node in the list
    @head
  end

  def tail
    #tail returns the last node in the list
    @tail
  end

  def at(index)
    #at(index) returns the node at the given index
    return nil if @head.nil?
    pointer = @head

    index.times { pointer = pointer.next }

    pointer
  end

  def pop
    #pop removes the last element from the list
    return nil if @head.nil?
    second_to_last_node = self.at(self.size - 2)
    @tail = second_to_last_node
    second_to_last_node.next = nil
  end

  def contains?(value)
    #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
    return nil if @head.nil?
    num_of_nodes = self.size
    pointer = @head
    num_of_nodes.times do
      if pointer.data == value
        return true
      else
        pointer = pointer.next
      end
    end
    false
  end

  def find(value)
    #find(value) returns the index of the node containing value, or nil if not found.
    return nil if @head.nil?
    num_of_nodes = self.size
    pointer = @head
    num_of_nodes.times do |node_index|
      if pointer.data == value
        return node_index
      else
        pointer = pointer.next
      end
    end
    nil
  end

  def to_s
    #to_s represent your LinkedList objects as strings,
    #so you can print them out and preview them in the console.
    #The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    node = @head
    self.size.times do
      print "(#{node.data}) --> "
      node = node.next
    end
  end
end

# Basic node, buildtak kaing up the LinkedList
class Node
  attr_accessor :next, :data

  def initialize(data)
    @next = nil
    @data = data
  end
end

ll = LinkedList.new
ll.append(Node.new("abc"))
ll.append(Node.new("def"))
p ll.size
p ll
puts ""
ll.append(Node.new("ghi"))
ll.prepend(Node.new("kurde"))
p ll.size
p ll
puts ""

ll.pop

p ll.size
p ll
puts ""

p ll.contains?("kurde")
puts ""

p ll.find("abc")
puts ""

ll.to_s
