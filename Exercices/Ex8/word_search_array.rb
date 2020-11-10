class WordSearchArray
    def initialize
      @words = Array.new
    end
    def insert word
      @words << word
    end
    def list_words visitor
      @words.each do |word|
        visitor.visit word
      end
    end
  end