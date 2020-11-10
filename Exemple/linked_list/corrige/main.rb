require './double_linked_list'

list = DoubleLinkedList.new

puts "List empty? #{list.empty?}"

list.add_tail('C')
list.add_tail('O')
list.add_tail('O')
list.add_tail('L')
puts "List size: #{list.size}"

list.add_head('&')
list.add_head('H')
list.add_head('S')
list.add_head('E')
list.add_head('R')
list.add_head('F')
puts "List size: #{list.size}"

puts "List empty? #{list.empty?}"

print "List: "
list.each {|value| print value}
puts

puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"

puts "RemoveTail: #{list.remove_tail}"
puts "RemoveTail: #{list.remove_tail}"

print "List: "
list.each {|value| print value}
puts

# Test edge case
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"
puts "RemoveHead: #{list.remove_head}"

puts "You should see an empty list exception now"
begin
  puts "RemoveHead: #{list.remove_head}"
rescue EmptyListError
  puts "!!! The list is empty, you bastard !!!"
end
