require_relative "../linked_list_has_loop"
require_relative "../../../data-structures/linked_list"

RSpec.describe "has_loop?" do
  it "returns false if given a single node" do
    expect(has_loop?(ListNode.new(0))).to be false
  end

  it "returns false if there is no loop" do
    expect(has_loop?(create_list((0..10).to_a))).to be false
  end

  it "detects a full circle" do
    expect(has_loop?(create_loop((0..5).to_a, 0))).to be true
  end

  it "detects a long odd loop" do
    expect(has_loop?(create_loop((0..10).to_a, 2))).to be true
  end

  it "detects a long even loop" do
    expect(has_loop?(create_loop((0..10).to_a, 1))).to be true
  end

  it "detects a short odd loop" do
    expect(has_loop?(create_loop((0..10).to_a, 9))).to be true
  end

  it "detects a short even loop" do
    expect(has_loop?(create_loop((0..10).to_a, 8))).to be true
  end
end

def create_loop(vals, loop_idx)
  i = 0
  start = ListNode.new(vals[i])
  current = start

  while i < vals.length
    loop_node = current if i == loop_idx
    i += 1
    current.next = ListNode.new(vals[i])
    current = current.next
  end

  current.next = loop_node
  start
end
