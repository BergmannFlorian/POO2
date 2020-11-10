class SourceFactory
    def create source
        data = if source.start_with?('http://')
            require 'net/http'
            Net::HTTP.get(URI(source))
        else
            File.read(source)
        end
        return data
    end
end