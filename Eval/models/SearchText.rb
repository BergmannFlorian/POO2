require_relative "Parser.rb"
require_relative "InfoHandler.rb"
class SearchText
    def initialize text, parser
        @text, @handlers, @parserDecorator = text, [], parser
    end
    def addHandler handler
        @handlers << handler
    end
    def info
        infos = []
        @handlers.each do |handler|
            text = @parserDecorator.parse @text
            info = handler.get_info text
            infos << info
        end
        return infos
    end
end