require './graph.rb'

# Bredth-first search through a word graph

class SearchFailed < StandardError
end

class BFS
  attr_reader :graph

  def initialize(graph)

    # Graph class instance
    @graph = graph

    # BFS queue
    @queue = Array.new

    # Word path from endword to startword
    @path = Hash.new

    # Words that we've already used (visited)
    @used = Hash.new
  end
  
  # Traverse the graph beginning at startword and ending at endword
  # Implements a standard BFS search for shortest path through the graph
  def search(startword, endword)
    @queue.push(startword)
    @used[startword] = 1

    while @queue.count > 0
      current = @queue.shift()

      if current == endword
        result = Array.new
        parent = endword
        result.unshift(parent)
        loop do
          parent = @path[parent]
          result.unshift(parent)
          break if parent == startword
        end
        return result
      end

      @graph.neighbors(current, @used).each do |w|
        @queue.push(w)
        @used[w] = 1
        @path[w] = current
      end
    end
    raise SearchFailed, "No word ladder exists for #{startword} to #{endword}"
  end

end
