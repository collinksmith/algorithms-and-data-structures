require_relative "../dijkstra's_algorithm"

RSpec.describe "shortest_path" do
  # Visual representation of the test graph:
  #    B -2- C
  #   /      |
  #  5       3
  #  /       |
  # A   -9-  D
  #  \       |
  #  2       2
  #   \      |
  #    E -3- F

  graph = [
    [[1, 5], [3, 9], [4, 2]],
    [[0, 5], [2, 2]],
    [[1, 2], [3, 3]],
    [[0, 9], [2, 3], [5, 2]],
    [[0, 2], [5, 3]],
    [[3, 2], [4, 3]]
  ]

  it "returns -1 if given a non-existent start node" do
    expect(shortest_path(graph, 8, 4)).to eq(-1)
  end

  it "returns -1 if given a non-existent end node" do
    expect(shortest_path(graph, 0, 8)).to eq(-1)
  end

  it "returns a path with just the node if given the same start and end node" do
    expect(shortest_path(graph, 1, 1)).to eq({ path: [1], distance: 0 })
  end

  it "finds the shortest path of adjacent nodes" do
    expect(shortest_path(graph, 0, 4)).to eq({ path: [0, 4], distance: 2 })
  end

  it "finds a non-adjacent shortest path for adjacent nodes" do
    expect(shortest_path(graph, 3, 0)).to eq({ path: [3, 5, 4, 0], distance: 7 })
  end

  # Edge case. The algorithm first finds E,F,D,C with distance 8. Then it must check E,A,B,C, because the distance
  # from E to B is less than 8. This test verifies that it doesn't update the path when checking a new path that
  # ends up being longer.
  it "finds the shortest path with two similar-length paths" do
    expect(shortest_path(graph, 4, 2)).to eq({ path: [4, 5, 3, 2], distance: 8 })
  end
end