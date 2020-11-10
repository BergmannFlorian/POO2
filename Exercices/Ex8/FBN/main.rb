require_relative "visitor.rb"
require_relative "word_search_tree.rb"
require_relative "word_search_array.rb"

# Read the passed or default file containing function names
functions = File.readlines(ARGV[0] || 'functions.txt').map(&:chomp)

# Insert them in the tree and arrayy
tree = WordSearchTree.new
array = WordSearchArray.new
functions.each {|name| 
    tree.insert(name) 
    array.insert(name)
} 

# Write from tree visitor word more than 5 char
visitor = WordsListerMoreThan5Char.new
tree.list_words visitor
File.write("words_tree_more_than_5_char.txt", visitor.words.join("\n"), mode: "wb")

# Write from array visitor word more than 5 char
visitor = WordsListerMoreThan5Char.new
array.list_words visitor 
File.write("words_array_more_than_5_char.txt", visitor.words.join("\n"), mode: "wb")

# Write from tree visitor word start with
visitor = WordsListerStartWith.new "ar"
tree.list_words visitor
File.write("words_tree_start_with.txt", visitor.words.join("\n"), mode: "wb")

# Write from array visitor bis word start with
visitor = WordsListerStartWith.new "ar"
array.list_words visitor 
File.write("words_array_start_with.txt", visitor.words.join("\n"), mode: "wb")