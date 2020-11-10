class Validation
    def initialize validation
        @validation = validation
    end
    def isValid? text
        return @validation.call(text)
    end
end
class ValidationText
    def initialize arrayText
        @arrayText = arrayText
    end
    def isValid?
        valid = true
        @arrayText.each{|text|
            valid |= text.length > 3
        }
    end
end
class ValidationMail
    def initialize arrayText
        @arrayText = arrayText
    end
    def isValid?
        valid = true
        @arrayText.each{|text|
            valid = true
            valid |= mail =~ /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
        }
    end
end