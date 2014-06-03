# graphbuilder_spec.rb
require './graphbuilder_dynamic.rb'

describe GraphBuilderDynamic, "#findNeighbors" do
  it "builds the list of vertices that share an edge with the given vertex" do
    @words = { "food" => nil, "fool" => nil, "pool" => nil, "food" => nil, "ford" => nil, "wood" => nil, "wool" => nil }
    graph = Graph.new(@words, GraphBuilderDynamic.new)

    graph.neighbors("food").should match_array(["fool", "wood", "ford"])
    graph.neighbors("pool").should match_array(["fool", "wool"])
  end
end
