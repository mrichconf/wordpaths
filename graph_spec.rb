# graph_spec.rb
require './graph.rb'

describe Graph, "#addEdge" do
  it "raises an exception when adding an edge where a vertex is missing" do
    graph = Graph.new({ "foo" => {}, "bar" => {}, "baz" => {}})
    expect { graph.addEdge("foo", "qux") }.to raise_error(UnknownVertexGraphError, 'addEdge(): v1 qux cannot be found in the vertices list')
    expect { graph.addEdge("quux", "bar") }.to raise_error(UnknownVertexGraphError, 'addEdge(): v0 quux cannot be found in the vertices list')
    expect { graph.addEdge("foo", "foo") }.to raise_error(AddEdgeGraphError, 'addEdge(): v0 foo cannot be the same as v1 foo')
  end
  it "returns 1 when an edge is added from v0 to v1" do
    graph = Graph.new({ "foo" => {}, "bar" => {}, "baz" => {}})
    graph.addEdge("foo", "bar").should eq(1)
  end
end

describe Graph, "#neighbors" do
  it "returns the list of vertices that share an edge with the given vertex" do
    graph_data = {
      "food" => {
        "fool" => 1,
        "wood" => 1,
        "ford" => 1
      },
      "pool" => {
        "food" => 1,
        "fool" => 1
      },
      "wood" => {
        "wool" => 1,
        "food" => 1
      }
    }
    graph = Graph.new(graph_data)
    graph.neighbors("food").should match_array(["fool", "wood", "ford"])
    graph.neighbors("pool").should match_array(["fool", "food"])
  end
  it "raises an exception of the given vertex doesn't exist" do
    graph = Graph.new({ "food" => { "fool" => 1, "pool" => 1}, "pool" => { "food" => 1, "fool" => 1 }, "food" => { "fool" => 1, "pool" => 1, "ford" => 1 } })
    expect { graph.neighbors("fool") }.to raise_error(UnknownVertexGraphError, 'neighbors(): v fool cannot be found in the vertices list')
  end
end
