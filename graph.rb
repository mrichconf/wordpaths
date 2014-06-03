class UnknownVertexGraphError < StandardError
end
class AddEdgeGraphError < StandardError
end

class Graph
  attr_accessor :vertices

  def initialize(verts = {}, builder = nil)
    @graphbuilder = builder
    @vertices = Hash.new
    @vertices.merge!(verts) if verts
    @graphbuilder.build(self) if @graphbuilder
  end

  def [](name)
    raise UnknownVertexGraphError, "[]: name #{name} cannot be found in the vertices list" if !@vertices.has_key?(name)
    @vertices[name]
  end

  def neighbors(v, exclude = {})
    raise UnknownVertexGraphError, "neighbors(): v #{v} cannot be found in the vertices list" if !@vertices.has_key?(v)
    @graphbuilder.findNeighbors(v, exclude) if @vertices[v] == nil and @graphbuilder
    @vertices[v].keys
  end

  def addEdge(v0, v1)
    raise UnknownVertexGraphError, "addEdge(): v0 #{v0} cannot be found in the vertices list" if !@vertices.has_key?(v0)
    raise UnknownVertexGraphError, "addEdge(): v1 #{v1} cannot be found in the vertices list" if !@vertices.has_key?(v1)
    raise AddEdgeGraphError, "addEdge(): v0 #{v0} cannot be the same as v1 #{v1}" if v0 == v1
    @vertices[v0][v1] = 1
  end

end
