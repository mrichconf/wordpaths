# bfs_spec.rb
require './bfs.rb'

describe BFS, "#search" do
  it "finds a path from flux to alem" do
    graph_data = {
      "flux" => { "flex" => 1, "flue" => 1 },
      "flue" => { "flux" => 1 },
      "feal" => {  },
      "fund" => {  },
      "flex" => { "flux" => 1, "flem" => 1 },
      "flem" => { "flex" => 1, "alem" => 1 },
      "alem" => { "flem" => 1 }
    }
    graph = Graph.new(graph_data)

    bfs = BFS.new(graph)
    bfs.search("flux", "alem").should match_array(["flux", "flex", "flem", "alem"])
  end

  it "raises an exception if no path is found" do
    graph_data = {
      "flux" => { "flex" => 1, "flue" => 1 },
      "flue" => { "flux" => 1 },
      "feal" => {  },
      "fund" => {  },
      "flex" => { "flux" => 1 },
      "alem" => { }
    }
    graph = Graph.new(graph_data)

    bfs = BFS.new(graph)
    expect { bfs.search("flux", "alem") }.to raise_error(SearchFailed, 'No word ladder exists for flux to alem')

  end
end
