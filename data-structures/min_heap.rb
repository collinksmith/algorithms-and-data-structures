class MinHeap
  def initialize(a = [])
    build(a)
  end

  # O(log n)
  def insert(value)
    items.push(value)
    sift_up(size - 1)
  end

  # O(log n)
  def extract_min
    return if size == 0
    return items.pop if size == 1
    val = items[0]
    items[0] = items.pop
    sift_down(0)
    val
  end

  def get_min
    items.first
  end

  def size
    items.size
  end

  def to_s
    items.to_s
  end

  private

  attr_accessor :items

  # Efficient building algorithm. Runs in O(n)
  # A naive implementation of successively inserting each element runs in O(nlogn)
  def build(a)
    self.items = a
    (size / 2).downto(0) { |i| sift_down(i) }
  end

  def sift_up(i)
    parent_i = parent(i)
    return if i == 0 || items[parent_i] < items[i]
    items[i], items[parent_i] = items[parent_i], items[i]
    sift_up(parent_i)
  end

  def sift_down(i)
    return if leaf?(i) || satisfied?(i)
    left, right = left_child(i), right_child(i)
    smaller = !items[right] || items[left] < items[right] ? left : right
    items[i], items[smaller] = items[smaller], items[i]
    sift_down(smaller)
  end

  def satisfied?(i)
    val, left_val, right_val = items[i], items[left_child(i)], items[right_child(i)]
    !left_val || val < left_val && (!right_val || val < right_val)
  end

  def leaf?(i)
    i >= size / 2
  end

  def parent(i)
    (i - 1) / 2
  end

  def left_child(i)
    i * 2 + 1
  end

  def right_child(i)
    i * 2 + 2
  end
end

if __FILE__ == $PROGRAM_NAME
  heap = MinHeap.new([6,1,9,2,3,9,5,4,7])
  puts heap.get_min # 1
  heap.insert(2)
  heap.insert(777)
  heap.insert(0)
  heap.size.times { print "#{heap.extract_min} " } # 0 1 2 2 3 4 5 6 7 9 9 777
  puts
  puts heap # []
end
