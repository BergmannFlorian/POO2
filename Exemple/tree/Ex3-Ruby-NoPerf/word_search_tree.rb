#
# POO2: Ex3
# Pascal Hurni May 2016
# 

class WordSearchTree
  class Node
    BASE = 'a'.ord
    
    def initialize
      @children = Array.new(26)
    end
    
    def word?
      @word
    end
    
    def insert(word, rest)
      unless char = rest.slice!(0)
        @word = true
        return
      end
      
      child = @children[char.ord-BASE] ||= self.class.new
      child.insert(word, rest)
    end
    
    # Climb down the tree using the _path_ given in _rest_
    # returns either the final node or nil if the path doesn't match existing nodes
    def move_to(rest)
      return self unless char = rest.slice!(0)
      if child = @children[char.ord-BASE]
        child.move_to(rest)
      end
    end
  end
  
  def initialize
    @root = Node.new
  end
  
  def insert(word)
    raise "Invalid word given '#{word}', only a-z authorized!" if word !~ /^[a-z]+$/
    @root.insert(word, word.dup)
  end
  
  def include?(word)
    node = @root.move_to(word.dup)
    node && node.word?
  end
  
end
