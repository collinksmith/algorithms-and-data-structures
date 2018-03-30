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

  protected

  attr_accessor :items

  private

  # Efficient building algorithm. Runs in O(n)
  # A naive implementation of successively inserting each element runs in O(nlogn)
  def build(a)
    self.items = a
    (size / 2).downto(0) { |i| sift_down(i) }
  end

  def sift_up(i)
    parent_i = parent(i)
    return if i == 0 || value(parent_i) < value(i)
    items[i], items[parent_i] = value(parent_i), value(i)
    sift_up(parent_i)
  end

  def sift_down(i)
    return if leaf?(i) || satisfied?(i)
    left, right = left_child(i), right_child(i)
    smaller = !items[right] || value(left) < value(right) ? left : right
    items[i], items[smaller] = value(smaller), value(i)
    sift_down(smaller)
  end

  def satisfied?(i)
    val, left_val, right_val = value(i), value(left_child(i)), value(right_child(i))
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

  def value(i)
    items[i]
  end
end
