class Parser
    def parse text
        raise "method not implemented"
    end
end
class ParserSimple < Parser
    def parse text
        links = []
        start = 0
        loop do
            start = text.index('<a', start)
            break unless start
            start = text.index('href="', start)
            next unless start
            stop = text.index('"', start+6)
            next unless stop
            links.push text[start+6...stop]
        end
        return links
    end
end
class ParserRegexp < Parser
    def parse text
        return text.scan(/<a.*?href="(.+?)[!"]/).flatten
    end
end