class LinkedList
  attr_reader :size, :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @tail
      @tail.next_node = new_node
    else
      @head = new_node
    end
    @tail = new_node
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
    @tail = new_node unless @tail
    @size += 1
  end

  def at(index)
    return nil if index >= @size

    current_node = @head
    index.times { current_node = current_node.next_node }
    current_node
  end

  def pop
    return nil if @size == 0

    if @size == 1
      popped_node = @head
      @head = @tail = nil
    else
      current_node = @head
      (@size - 2).times { current_node = current_node.next_node }
      popped_node = current_node.next_node
      current_node.next_node = nil
      @tail = current_node
    end
    @size -= 1
    popped_node
  end

  def contains?(value)
    current_node = @head
    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    while current_node
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s
    elements = []
    current_node = @head
    while current_node
      elements << "( #{current_node.value} )"
      current_node = current_node.next_node
    end
    elements.join(' -> ') + ' -> nil'
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return append(value) if index >= @size

    previous_node = at(index - 1)
    new_node = Node.new(value, previous_node.next_node)
    previous_node.next_node = new_node
    @size += 1
  end

  def remove_at(index)
    return @head = @head.next_node if index == 0

    previous_node = at(index - 1)
    return unless previous_node && previous_node.next_node

    previous_node.next_node = previous_node.next_node.next_node
    @tail = previous_node if previous_node.next_node.nil?
    @size -= 1
  end
end

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')
puts list