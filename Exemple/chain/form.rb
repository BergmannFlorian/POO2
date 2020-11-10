require './chain/functions'

class Form
    def initialize
        @validations = []
        @inputDatas = []
    end
    def addValidation validation
        @validations << validation
    end
    def addInputData inputData
        @inputDatas << inputData
    end
    def isValid?
        valid = true
        @inputDatas.each{|inputData|
            @validations.each{|validation|
                valid &= validation.isValid? inputData
            }
        }
        return valid
    end
end

class UserForm < Form
    def initialize
        super
        addValidation(ValidationText.new)
        addValidation(ValidationMail.new)
    end
end