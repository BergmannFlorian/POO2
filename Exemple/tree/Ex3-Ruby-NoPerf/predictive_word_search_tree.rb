#
# POO2: Ex3
# Pascal Hurni May 2016
# 

require_relative 'word_search_tree'

class PredictiveWordSearchTree < WordSearchTree
  class Node < WordSearchTree::Node
    attr_reader :words
    
    def initialize
      super
      @words = []
    end
    
    def insert(word, rest)
      super
      @words << word
    end
  end
  
  def initialize
    @root = Node.new
  end
  
  def matching(beginning)
    # move to the node of the last char of `beginning`
    node = @root.move_to(beginning.dup)
    node ? node.words : []
  end
end
