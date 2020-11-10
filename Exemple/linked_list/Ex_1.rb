class LinkedList
    def initialize
        @head = nil
        @last = nil
        @size = 0
    end

    def head() @head end

    def addEnd(list)
        list = List.new(list, @last)
        @size += 1
        unless @head
            @head = list
            @last = @head
        else
            @last.add(list)
            @last = @last.next
        end
    end
    def addHead(list)
        list = List.new(list, @head)
        list.add(@head)
        @head = list
    end
    def removeEnd
        if @last.previous
            @last = @last.previous
            @last.previous = nil
            @size -= 1
        else
            @last = nil
            @head = nil
            @size = 0
        end
    end
    def removeHead 
        if @head.next
            @head = @head.next
            @head.previous = nil
            @size -= 1
        else
            @last = nil
            @head = nil
            @size = 0
        end
    end
    def listAll
        list = @head
        while list
            yield list
            list = list.next
        end
    end
    def getSize() return @size end
    def isEmpty() return @size == 0 end
    def getHead() return @head end
    def getLast() return @last end
end

class List
    def initialize list, previous
        @list = list
        @next = nil
        @previous = previous
    end

    def next() @next end
    def previous() @previous end

    def previous=(previous) @previous = previous end

    def add(list)
        unless @next
            @next = list
        else
            @next.add(list)
        end
    end
end

list = LinkedList.new

list.addEnd('c')
list.addEnd('o')
list.addEnd('o')
puts list.getSize
puts list.isEmpty
puts list.getHead

list.removeHead()
puts list.getSize
puts list.isEmpty
puts list.getHead

list.listAll {|list| puts list}