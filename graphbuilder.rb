# Strategy for populating a graph

class UndefinedStrategyError < StandardError
end

class GraphBuilder

  def build(g)
    raise UndefinedStrategyError, "build(): method not implemented for this class"
  end

  def findNeighbors(v)
    raise UndefinedStrategyError, "findNeighbors(): method not implemented for this class"
  end

end
