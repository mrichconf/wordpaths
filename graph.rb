class UnknownVertexGraphError < StandardError
end
class AddEdgeGraphError < StandardError
end

class Graph

  def initialize(verts = {})
    @vertices = Hash.new
    @vertices.merge!(verts) if verts
  end

  def [](name)
    raise UnknownVertexGraphError, "[]: name #{name} cannot be found in the vertices list" if !@vertices.has_key?(name)
    @vertices[name]
  end

  def neighbors(v)
    raise UnknownVertexGraphError, "neighbors(): v #{v} cannot be found in the vertices list" if !@vertices.has_key?(v)
    @vertices[v].keys
  end

  def addEdge(v0, v1)
    raise UnknownVertexGraphError, "addEdge(): v0 #{v0} cannot be found in the vertices list" if !@vertices.has_key?(v0)
    raise UnknownVertexGraphError, "addEdge(): v1 #{v1} cannot be found in the vertices list" if !@vertices.has_key?(v1)
    raise AddEdgeGraphError, "addEdge(): v0 #{v0} cannot be the same as v1 #{v1}" if v0 == v1
    @vertices[v0][v1] = 1
  end

end
