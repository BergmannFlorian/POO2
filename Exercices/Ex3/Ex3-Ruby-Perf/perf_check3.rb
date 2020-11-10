#
# POO2: Ex3
# Pascal Hurni May 2016
# 

require './word_search_tree'
require 'set'
require 'benchmark/ips'

# Read the passed or default file containing function names
functions_array = File.readlines(ARGV.shift || 'functions.txt').map(&:chomp)

# Insert them in the tree
functions_tree = WordSearchTree.new
functions_array.each {|name| functions_tree.insert(name) }
functions_set = Set.new(functions_array)

# specify the check context
word_count = functions_array.size
interval = 25

# Concrete code that performs the check
performance_check_for = ->(word_to_find, index) do
  puts "\n== #{word_to_find} @ #{index.to_s.ljust(6)} #{'=' * (80-word_to_find.size)}"
  times = Benchmark.ips do |x|
    x.report("tree.include?")  { functions_tree.include?(word_to_find) }
    x.report("array.include?") { functions_array.include?(word_to_find) }
    x.report("array.find")     { functions_array.find {|word| word == word_to_find} }
    x.report("array.bsearch")  { functions_array.bsearch {|word| word <=> word_to_find} }
    x.report("set.include?")   { functions_set.include?(word_to_find) }
    x.compare!
  end
end

# Any specific word given ?
if ARGV.empty?
  # No, print banner with the check context
  puts "Finding words in a set of #{word_count}"

  # Run the benchmark by taking several words, each at _interval_ percent of the set size
  0.step(100, interval).each do |percent|
    # compute the index (take care of not going after the last item!)
    index = [word_count*percent/100, word_count-1].min
  
    # get the word
    word_to_find = functions_array[index]

    # run the benchmark
    performance_check_for.(word_to_find, index)
  end
else
  # Yes, check for these ones
  ARGV.each do |word_to_find|
    performance_check_for.(word_to_find, functions_array.index(word_to_find))
  end
end
