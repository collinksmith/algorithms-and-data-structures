class QueueNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end
end

class Queue
  def add(value)
    new_node = QueueNode.new(value)
    last.next = new_node if last
    self.last = new_node
    self.first = new_node unless first
  end

  def remove
    return nil unless first
    res = first
    self.first = first.next
    res.value
  end

  def peek
    return nil unless first
    first.value
  end

  def isEmpty
    first == nil
  end

  private

  attr_accessor :first, :last
end

if __FILE__ == $PROGRAM_NAME
  queue = Queue.new
  queue.add(1)
  queue.add(2)
  puts queue.peek     # 1
  puts queue.remove   # 1
  puts queue.peek     # 2
  puts queue.isEmpty  # false
  puts queue.remove   # 2
  puts queue.isEmpty  # true
end