require_relative './min_heap'

class MapMinHeap < MinHeap
  def initialize(a = [])
    self.map = {}
    super(a)
  end

  def extract_min
    return if size == 0
    return items.pop if size == 1
    val = items[0]
    items[0] = items.pop
    map[items[0][0]] = 0
    sift_down(0)
    return if !val
    map.delete(val[0])
    val
  end

  # O(1)
  def contains?(key)
    !!map[key]
  end

  # O(log n)
  def decrease(key, val)
    i = map[key]
    return false if items[i][1] <= val
    items[i][1] = val
    sift_up(i)
    true
  end

  def to_s
    items.map { |el| el[1] }.to_s
  end

  def inspect
    items
  end

  private

  attr_accessor :map

  def build(a)
    self.items = a
    items.each_with_index { |el, i| map[el[0]] = i }
    (size / 2).downto(0) { |i| sift_down(i) }
  end

  def sift_up(i)
    parent_i = parent(i)
    return if i == 0 || value(parent_i) < value(i)
    items[i], items[parent_i] = items[parent_i], items[i]
    map[items[i][0]] = i
    map[items[parent_i][0]] = parent_i
    sift_up(parent_i)
  end

  def sift_down(i)
    return if leaf?(i) || satisfied?(i)
    left, right = left_child(i), right_child(i)
    smaller = !items[right] || value(left) < value(right) ? left : right
    items[i], items[smaller] = items[smaller], items[i]
    map[items[i][0]] = i
    map[items[smaller][0]] = smaller
    sift_down(smaller)
  end

  def satisfied?(i)
    val, left_val, right_val = value(i), value(left_child(i)), value(right_child(i))
    !left_val || val < left_val && (!right_val || val < right_val)
  end

  def value(i)
    el = items[i]
    el && el[1]
  end
end
