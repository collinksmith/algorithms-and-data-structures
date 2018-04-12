require_relative '../map_min_heap'

RSpec.describe MapMinHeap do
  before(:each) do
    @heap = MapMinHeap.new
  end

  describe "initialize" do
    it "accepts an array of arrays" do
      expect { MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]]) }.not_to raise_error
    end
  end

  describe "insert" do
    it "accepts a value" do
      expect { @heap.insert(['j', 2]) }.not_to raise_error
    end

    it "adds the vale" do
      @heap.insert(['k', 2])
      expect(@heap.get_min).to eq(['k', 2])
    end
  end


  describe "get_min" do
    it "returns nil if the heap is empty" do
      expect(@heap.get_min).to be_nil
    end

    it "returns the minimum value in the heap" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.get_min).to eq(['b', 1])
    end
  end

  describe "extract_min" do
    it "returns nil if the heap is empty" do
      expect(@heap.get_min).to be_nil
    end

    it "returns the minimum value in the heap" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.get_min).to eq(['b', 1])
    end

    it "removes the minimum value from the heap" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      prior_size = heap.size
      heap.extract_min
      expect(heap.size).to eq(prior_size - 1)
      remaining_items = []
      heap.size.times { remaining_items.push(heap.extract_min) }
      expect(remaining_items).not_to include(['b', 1])
    end
  end

  describe "size" do
    it "returns 0 if the heap is empty" do
      expect(@heap.size).to eq(0)
    end

    it "returns the number of items in the heap" do
      test_items = [['a',6],['b',1],['c',9],['d',2]]
      expect(MapMinHeap.new(test_items).size).to eq(test_items.length)
    end
  end

  it "returns items from smallest to largest" do
    heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
    heap.insert(['e', 100])
    prev = nil
    
    while heap.get_min
      current = heap.extract_min
      expect(prev[1]).to be <= current[1] if prev
      prev = current
    end
  end

  describe "contains?" do
    it "returns false if the heap is empty" do
      expect(@heap.contains?('a')).to be false
    end

    it "returns false if the heap doesn't contain the item" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.contains?('e')).to be false
    end

    it "returns true if the heap does contain the item" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.contains?('a')).to be true
    end
  end

  describe "decrease" do
    it "returns false if the value of the key is less than the provided value" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.decrease('a', 7)).to be false
    end

    it "returns false if the value of the key is equal to the provided value" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.decrease('a', 6)).to be false
    end

    it "returns true if the value of the key is greater than the provided value" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      expect(heap.decrease('a', 0)).to be true
    end

    it "decreases the key" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2]])
      heap.decrease('a', 0)
      expect(heap.get_min).to eq(['a', 0])
    end

    it "reorganizes the items and returns the items from smallest to largest" do
      heap = MapMinHeap.new([['a',6],['b',1],['c',9],['d',2],['e',3],['f',9],['g',5],['h',4],['i',7]])
      heap.decrease('i', 0)
      heap.decrease('b', -1)
      prev = nil
      
      while heap.get_min
        current = heap.extract_min
        expect(prev[1]).to be <= current[1] if prev
        prev = current
      end
    end
  end
end
