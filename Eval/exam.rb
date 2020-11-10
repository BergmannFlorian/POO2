require_relative "models/Source.rb"
require_relative "models/Parser.rb"
require_relative "models/InfoHandler.rb"
require_relative "models/SearchText.rb"

# get arg
parse_method = ARGV[1] || 'simple'
source = ARGV[0]

# get source text
sourceFactory = SourceFactory.new
text = sourceFactory.create source

# initialize parser
if parse_method == 'simple'
    parser = ParserSimple.new
elsif parse_method == 'regexp'
    parser = ParserRegexp.new
else
    puts "Unknown parse method"
    exit
end

# create search text class
searchText = SearchText.new text, parser 

# add handlers
longestLinkInfoHandler = LongestLinkInfoHandler.new
linksNumberInfoHandler = LinksNumberInfoHandler.new
searchText.addHandler longestLinkInfoHandler
searchText.addHandler linksNumberInfoHandler

# get and display infos
puts searchText.info