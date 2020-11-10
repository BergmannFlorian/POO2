require 'benchmark'

class EmptyListError < StandardError
end

class DoubleLinkedList
  class Node
    attr_accessor :value, :prev, :next
    
    def initialize(value, prev, next_node)
      @value, @prev, @next = value, prev, next_node
    end
  end
  
  attr_reader :size
  
  def initialize
    @size = 0
  end
  
  def empty?
    @size == 0
  end
  
  def add_head(value)
    node = Node.new(value, nil , @head)
    if @head
      @head.prev = node
    else
      @tail = node
    end
    @head = node
    @size += 1
  end
  
  def add_tail(value)
    node = Node.new(value, @tail , nil)
    if @tail
      @tail.next = node
    else
      @head = node
    end
    @tail = node
    @size += 1
  end
  
  def remove_head
    raise EmptyListError unless @head
    
    node = @head
    @head = node.next
    
    if @head
      @head.prev = nil
    else
      @tail = nil
    end
    
    @size -= 1
    node.value
  end
  
  def remove_tail
    raise EmptyListError unless @tail
    
    node = @tail
    @tail = node.prev
    
    if @tail
      @tail.next = nil
    else
      @head = nil
    end
    
    @size -= 1
    node.value
  end

  def head
    raise EmptyListError unless @head
    @head.value
  end
  
  def tail
    raise EmptyListError unless @tail
    @tail.value
  end
  
  def each
    cursor = @head
    while cursor
      yield cursor.value
      cursor = cursor.next
    end
  end
  
end

class Queues_Array
    def initialize i
        @array = Array.new
        while @array.length < i do
            @array.push('c')
        end
    end
    def empty?
        @array.empty?
    end
    def size?
        @array.length
    end
    def enqueue elem #ajoute à la fin
        @array.push(elem)
    end
    def dequeue #supprimme au début
        @array.shift
    end
end
class Queues_List
    def initialize i
        @list = DoubleLinkedList.new
        while @list.size < i do
            @list.add_tail('c')
        end
    end
    def empty?
        @list.size == 0
    end
    def size?
        @list.size
    end
    def enqueue elem #ajoute à la fin
        @list.add_tail(elem)
    end
    def dequeue #supprimme au début
        @list.remove_head
    end
end

arrayCent = Queues_Array.new(1000)
arrayMille = Queues_Array.new(100000)
listCent = Queues_List.new(1000)
listMille = Queues_List.new(100000)

n = 200000000

Benchmark.bm(20) do |bm| 
    bm.report("array 1k enqueue"){ n.times do; arrayCent.enqueue('a'); end }
    bm.report("array 1k dequeue"){ n.times do; arrayCent.dequeue; end }
    bm.report("array 100k enqueue"){ n.times do; arrayMille.enqueue('a'); end }
    bm.report("array 100k dequeue"){ n.times do; arrayMille.dequeue; end }
    bm.report("list 1k enqueue"){ n.times do; listCent.enqueue('a'); end }
    bm.report("list 1k dequeue"){ n.times do; listCent.dequeue; end }
    bm.report("list 100k enqueue"){ n.times do; listMille.enqueue('a'); end }
    bm.report("list 100k dequeue"){ n.times do; listMille.dequeue; end }
end