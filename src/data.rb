require "./errors.rb"

$binding = {}

class ArcticBinding
    def initialize(statement)
        if(statement != nil) then
            @statement = statement
            @tokens = @statement.split(' ')
        end
    end

    def create()
        type = @tokens[0]
        identifier = @tokens[1]
        value = @tokens[3]
        typeChecker = Type.new(value)
        typeOfValue = typeChecker.checkType()

        if type == typeOfValue then
            $binding[identifier] = {
                "type" => type,
                "value" => value,
                "immutable" => false
            }
            return
        end

        err = ArcticError.new($ERR_TYPE_MISMATCH, "err")
    end

    def searchInBindings(identifier)
        if identifier.include?("&") then
            identifier["&"] = ""
        end

        identifier = identifier.strip()
        data = $binding.fetch(identifier)

        if data then
            return data
        else err = ArcticError.new($ERR_BINDING_NOT_FOUND, "err")
        end
    end

    def printBindings()
        puts $bindings
    end
end