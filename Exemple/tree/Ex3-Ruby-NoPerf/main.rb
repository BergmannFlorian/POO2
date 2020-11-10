#
# POO2: Ex3
# Pascal Hurni May 2016
# 

require './word_search_tree'

# Read the passed or default file containing function names
functions_array = File.readlines(ARGV[0] || 'functions.txt').map(&:chomp)

# Insert them in the tree
functions_tree = WordSearchTree.new
functions_array.each {|name| functions_tree.insert(name) }

# Interact with the user
loop do
  print "Please, type a function name: "
  name = gets.chomp
  break if name.empty?
  puts functions_tree.include?(name) ? 'Yes, this is a valid one' : 'Sorry, not found'
end
