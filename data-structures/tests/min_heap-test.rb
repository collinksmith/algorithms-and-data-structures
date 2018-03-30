require_relative '../min_heap'

RSpec.describe MinHeap do
  before(:each) do
    @heap = MinHeap.new
  end

  describe "initialize" do
    it "accepts an array" do
      expect { MinHeap.new([6,1,9,2,3,9,5,4,7]) }.not_to raise_error
    end
  end

  describe "insert" do
    it "accepts a value" do
      expect { @heap.insert(2) }.not_to raise_error
    end

    it "adds the vale" do
      @heap.insert(2)
      expect(@heap.get_min).to eq(2)
    end
  end

  describe "get_min" do
    it "returns nil if the heap is empty" do
      expect(@heap.get_min).to be_nil
    end

    it "returns the minimum value in the heap" do
      heap = MinHeap.new([8,6,3,1])
      expect(heap.get_min).to eq(1)
    end
  end

  describe "extract_min" do
    it "returns nil if the heap is empty" do
      expect(@heap.get_min).to be_nil
    end

    it "returns the minimum value in the heap" do
      heap = MinHeap.new([8,6,3,1])
      expect(heap.get_min).to eq(1)
    end

    it "removes the minimum value from the heap" do
      heap = MinHeap.new([8,6,3,1])
      prior_size = heap.size
      heap.extract_min
      expect(heap.size).to eq(prior_size - 1)
      remaining_items = []
      heap.size.times { remaining_items.push(heap.extract_min) }
      expect(remaining_items).not_to include(1)
    end
  end

  describe "size" do
    it "returns 0 if the heap is empty" do
      expect(@heap.size).to eq(0)
    end

    it "returns the number of items in the heap" do
      test_items = [1,2,3,4,10]
      expect(MinHeap.new(test_items).size).to eq(test_items.length)
    end
  end

  it "returns items from smallest to largest" do
    heap = MinHeap.new([7,-1,3,6,9,2,16,-7])
    heap.insert(100)
    prev = nil
    
    while heap.get_min
      current = heap.extract_min
      expect(prev).to be <= current if prev
      prev = current
    end
  end
end