require "./errors.rb"

$binding = {}

class ArcticBinding
    def initialize(statement)
        @statement = statement
        @tokens = @statement.split(' ')
    end

    def create()
        type = @tokens[0]
        identifier = @tokens[1]
        value = @tokens[3]
        typeChecker = Type.new(value)
        typeOfValue = typeChecker.checkType()

        if type == typeOfValue then
            puts "variable created..."
            return
        end

        err = ArcticError.new($ERR_TYPE_MISMATCH, "err")
    end
end