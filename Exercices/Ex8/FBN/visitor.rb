class WordsVisitor
    def visit word
        raise 'visit method not define'
    end
    def write filename
        raise 'write method not define'
    end
end

class WordsListerMoreThan5Char < WordsVisitor
    attr_reader :words
    def initialize
        @words = Array.new
    end
    def visit word
        @words << word if word.length >= 5
    end
end

class WordsListerStartWith < WordsVisitor
    attr_reader :words
    def initialize start
        @words = Array.new
        @start = start
    end
    def visit word
        @words << word if word.start_with? @start
    end
end