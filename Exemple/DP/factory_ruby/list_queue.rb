require './double_linked_list'

class ListQueue
  def initialize
    @data = DoubleLinkedList.new
  end
  
  def enqueue(value)
    @data.add_tail(value)
  end
  
  def dequeue
    @data.remove_head
  end
  
  def empty?
    @data.empty?
  end
  
  def size
    @data.size
  end
end
