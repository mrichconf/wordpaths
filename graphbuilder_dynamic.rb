require './graph.rb'
require './graphbuilder.rb'

# Strategy for populating a graph

class GraphBuilderDynamic < GraphBuilder

  def initialize()
  end

  def build(g)
    @graph = g
  end

  def findNeighbors(v, exclude={})
    if !@graph.vertices[v].is_a?(Hash)
      @graph.vertices[v] = Hash.new
      @graph.vertices.each do |h,k|
        next if exclude[h]
        if isNeighbor(v, h)
          @graph.addEdge(v, h)
        end
      end
    end
    @graph[v].keys
  end

  def isNeighbor(s1, s2)
    cost = 0
    (0..s1.length-1).each { |i| 
      cost += (s1[i] == s2[i]) ? 0 : 1
    }
    cost == 1
  end

end
