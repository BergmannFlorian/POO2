class InfoHandler
    def get_info links
        raise "method not implemented"
    end
end
class LongestLinkInfoHandler < InfoHandler
    def get_info links
        return links.sort_by {|link| link.size}.last
    end
end
class LinksNumberInfoHandler < InfoHandler
    def get_info links
        return links.select {|link| link.start_with? 'http://'}.size
    end
end