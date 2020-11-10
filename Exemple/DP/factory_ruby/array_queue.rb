class ArrayQueue
  def initialize
    @data = []
  end
  
  def enqueue(value)
    @data.push(value)
  end
  
  def dequeue
    @data.shift
  end
  
  def empty?
    @data.empty?
  end
  
  def size
    @data.size
  end
end
