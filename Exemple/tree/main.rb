class WordSearchTree
    attr_accessor :root
    
    def initialize
        @root
    end

    def addFunction functionName
        @root = Node.new('root') if @root.nil?
        @root.addFunction(functionName)
    end
    def searchFunction functionName
        node = @root
        functionName.split.each{|char|
            puts char
            nextNode = node.getChildWith(char)
            return false if nextNode == false
            node = nextNode
        }
        return true
    end
    def showTree
        node = @root
        while node
            yield node.content
            node = node.childs[0]
        end
    end
end

class Node
    attr_accessor :content, :childs
    def initialize content
        @content = content, @childs = Array.new
    end
    def addFunction functionName
        node = nil
        @childs.each{|child| node = child if child.content == functionName[0]}
        if node.nil?
            node = Node.new(functionName[0]) 
            @childs << (node)
        end
        node.addFunction(functionName[1..-1]) if functionName.length > 1
    end
    def getChildWith char
        result = false
        @childs.each{|child| 
            puts child.content
            result = child if child.content == char
        }
        return result
    end
end

file_data = File.open("./tree/functions.txt").read.split

tree = WordSearchTree.new
tree.addFunction("test")
# file_data.each{|functionName| tree.addFunction(functionName)}
tree.showTree {|content| puts content}
puts tree.searchFunction("test")