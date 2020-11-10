#
# POO2: Ex3
# Pascal Hurni May 2016
# 

require './Ex3-Ruby-Perf/word_search_tree'
require 'benchmark'

# Read the passed or default file containing function names
functions_array = File.readlines(ARGV[0] || 'functions.txt').map(&:chomp)

# Insert them in the tree
functions_tree = WordSearchTree.new
functions_array.each {|name| functions_tree.insert(name) }

# specify the check context
word_count = functions_array.size
iterations = 10000
interval = 25

# print banner with the check context
puts "Finding words in a set of #{word_count} iterating #{iterations} times"

# Run the benchmark by taking several words, each at _interval_ percent of the set size
0.step(100, interval).each do |percent|
  # compute the index (take care of not going after the last item!)
  index = [word_count*percent/100, word_count-1].min
  
  # get the word
  word_to_find = functions_array[index]

  # run the benchmark
  puts "\n== #{word_to_find} @ #{index.to_s.ljust(6)} #{'=' * (60-word_to_find.size)}"
  times = Benchmark.bmbm do |x|
    x.report("tree.include?")  { iterations.times { functions_tree.include?(word_to_find) } }
    x.report("array.include?") { iterations.times { functions_array.include?(word_to_find)  } }
    x.report("array.find")     { iterations.times { functions_array.find {|word| word == word_to_find} } }
  end
  # display the speed factor of the tree compared to the 2 array algorithms
  puts
  puts "#{times[0].label} is #{'%0.1f' % (times[1].total/times[0].total)} times faster than #{times[1].label}"
  puts "#{times[0].label} is #{'%0.1f' % (times[2].total/times[0].total)} times faster than #{times[2].label}"
end
