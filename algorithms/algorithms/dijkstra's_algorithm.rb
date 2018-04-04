require_relative '../../data-structures/map_min_heap'

# Takes a graph in the form of an adjacency list, as well as the desired start and end nodes
# Returns an object with the shortest path in the form of an array of nodes, and the distance of that path
def shortest_path(adj_list, start_node, end_node)
  parents = {}
  distances = {}
  current_distances = MapMinHeap.new(create_node_array(adj_list, start_node))

  # Of the remaining nodes, remove the one with the shortest distance and add it to the hash of known
  # shortest distances, then update its neighbors.
  while current_distances.size > 0
    node, distance = current_distances.extract_min
    distances[node] = distance
    break if node == end_node

    # Iterate through adjacent nodes and update them if necessary.
    # If the distance from the start node to the adjacent node through the current node is less than the
    # previously found shortest distance to the adjacent node, then update the adjacent node's shortest
    # distance and parent.
    adj_list[node].each do |neighbor|
      adj_node, adj_distance = neighbor
      next if distances[adj_node]
      parents[adj_node] = node if current_distances.decrease(adj_node, adj_distance + distance)
    end
  end

  distance = distances[end_node]
  return -1 if !distance || distance == Float::INFINITY
  path = get_path(parents, end_node)
  { path: path, distance: distance }
end

def create_node_array(adj_list, start_node)
  nodes = []
  adj_list.length.times { |node| nodes.push([node, node == start_node ? 0 : Float::INFINITY]) }
  nodes
end

# Go through the parents, starting with the end node, until you reach the root node
# (The node that doesn't have a parent is the root node.)
# Returns an array listing the path from the root node to the end node
def get_path(parents, end_node)
  path = [end_node]
  current_node = end_node
  
  while parents[current_node]
    path.push(parents[current_node])
    current_node = parents[current_node]
  end

  path.reverse
end
