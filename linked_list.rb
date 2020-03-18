require_relative 'node.rb'

class LinkedList


  def initialize(value)
    @head = Node.new(value=value)
  end

  def append(value)
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    new_node = Node.new(value=value)
    current.next_node = new_node
  end

  def prepend(value)
    new_node = Node.new(value=value)
    old_head = @head
    @head = new_node
    @head.next_node = old_head
  end

  def size()
    i = 0
    current = @head
    while current.next_node != nil
      i += 1
      current = current.next_node
    end
    i+1
  end

  def head()
    @head
  end

  def tail()
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current
  end

  def at(index)
    if index < 0
      index = self.size + index
    end
    current = @head
    index.times do
      current = current.next_node
      return nil if current == nil
    end
    current
  end

  def pop()
    last = self.tail
    current = @head
    while current.next_node != last
      current = current.next_node
    end
    current.next_node = nil
    last
  end

  def find(value)
    current = @head
    index = 0
    while current != nil
      if current.value == value
        return index
      else
        current = current.next_node
        index += 1
      end
    end
    nil
  end

  def contains?(value)
    !!find(value)
  end

  def to_s()
    current = @head
    while current != nil
      print "( #{current.value} ) -> "
      current = current.next_node
    end
    print "nil"
  end

  # EXTRA CREDIT
  def insert_at(value, index)
    if index == 0
      self.prepend(value)
    elsif index >= self.size-1
      nil
    else
      old_node = self.at(index)
      new_node = Node.new(value=value, next_node=old_node)

      # get the previous node and modify the link
      previous_node = self.at(index-1)
      previous_node.next_node = new_node
    end
  end

  def remove_at(index)
    if index == 0
      old_head = @head
      @head = @head.next_node
      # return the removed node
      old_head
    elsif index == -1
      # return the removed node
      self.pop
    else
      next_node = self.at(index+1)
      node_to_remove = self.at(index)
      prev_node = self.at(index-1)
      prev_node.next_node = next_node
      # return the removed node
      node_to_remove
    end
  end

end


# Testing code

ll = LinkedList.new("A")
puts ll.to_s
puts "Size: #{ll.size}"
puts "Head: #{ll.head.value}"
puts "Tail: #{ll.tail.value}"

ll.append("a")
puts ll.to_s
puts "Size: #{ll.size}"
puts "Head: #{ll.head.value}"
puts "Tail: #{ll.tail.value}"

ll.append("b")
# puts ll.to_s
# puts "Size: #{ll.size}"
# puts "Head: #{ll.head.value}"
# puts "Tail: #{ll.tail.value}"

ll.prepend("0")
puts ll.to_s
puts "Size: #{ll.size}"
puts "Head: #{ll.head.value}"
puts "Tail: #{ll.tail.value}"

ll.append("c")
ll.append("d")
ll.append("e")
ll.append("f")
puts ll.to_s
# puts "At Index 0: #{ll.at(0)}"
# puts "At Index 3: #{ll.at(3)}"
# puts "At Index 10: #{ll.at(10)}"
# puts "At Index -1: #{ll.at(-1)}"

# puts ll.pop.value
# puts ll.pop.value
# puts ll.to_s

# puts "Index of '0': #{ll.find("0")}"
# puts "Index of 'b': #{ll.find("b")}"
# puts "Index of 'c': #{ll.find("c")}"
# puts "Index of 'f': #{ll.find("f")}"
# puts "Index of 'H': #{ll.find("H")}"
# puts "List contains 'a': #{ll.contains?('a')}"
# puts "List contains 'f': #{ll.contains?('f')}"
# puts "List contains '0': #{ll.contains?('0')}"
# puts "List contains 'Z': #{ll.contains?('Z')}"

puts "Inserting '1' at Index 1"
ll.insert_at("1", 1)
puts ll.to_s

puts "Inserting '4' at Index 4"
ll.insert_at("4", 4)
puts ll.to_s

puts "Inserting '-1' at Index -1"
ll.insert_at("-1", -1)
puts ll.to_s

puts "Removing at Index 3"
puts ll.remove_at(3).value
puts ll.to_s

puts "Removing at Index -2"
puts ll.remove_at(-2).value
puts ll.to_s

puts "Removing at Index 0"
puts ll.remove_at(0).value
puts ll.to_s
