require './queue_factory'

queue_kind = ARGV[0] || 'list'

puts "Creating the post office queue"

postoffice = QueueFactory.create(queue_kind)
postoffice = Queue(queue_kind)

puts "Enqueing 2 clients"
postoffice.enqueue "First client"
postoffice.enqueue "Second client"

puts "Current size of the queue: #{postoffice.size}"

puts "Dequeing: #{postoffice.dequeue}"

puts "Current size of the queue: #{postoffice.size}"

puts "Dequeing: #{postoffice.dequeue}"
