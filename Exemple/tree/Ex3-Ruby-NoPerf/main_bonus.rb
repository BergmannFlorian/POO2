#
# POO2: Ex3
# Pascal Hurni May 2016
# 

require './predictive_word_search_tree'

# Read the passed or default file containing function names
functions_array = File.readlines(ARGV[0] || 'functions.txt', chomp: true)

# Insert them in the tree
functions_tree = PredictiveWordSearchTree.new
functions_array.each {|name| functions_tree.insert(name) }

# Interact with the user
loop do
  print "Please, type the beginning of a function name: "
  beginning = gets.chomp
  break if beginning.empty?
  
  loop do
    names = functions_tree.matching(beginning)
    if names.empty?
      puts "No more names!"
      break
    end
    puts names.map {|name| "  #{name}" }
    
    print "Type the next char after (#{beginning}): "
    beginning += gets.chomp
  end
end
