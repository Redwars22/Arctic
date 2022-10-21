=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

require "./errors.rb"
require "./operators.rb"
require "./types.rb"
require "./data.rb"

$binding = {}

class ArcticBinding
    def initialize(statement)
        if(statement != nil) then
            @statement = statement
            @tokens = @statement.split($ASSIGN)
        end
    end

    def create()
        dataIdentifier = @tokens[0].split(' ')
        type = dataIdentifier[0]
        identifier = dataIdentifier[1]
        value = @tokens[1]
        typeChecker = Type.new(value)
        typeOfValue = typeChecker.checkType()

        if identifier.include?("!") then
            identifier["!"] = ""
            if type == typeOfValue then
                $binding[identifier] = {
                    "type" => type,
                    "value" => value,
                    "immutable" => true
                }
                return
            end
            return
        end

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

    def deleteBindings(identifier)
        variable = $binding.fetch(identifier.strip())

        if variable 
            $binding.delete(identifier.strip())
            return
        else err = ArcticError.new("you cannot delete #{identifier} because it doesn't exist", "err")
        end
    end

    def assignToVariable(statement)
        statement = statement.split("<=")
        tokens = statement
        identifier = tokens[0].strip()
        value = tokens[1].strip()

        searchInBindings identifier

        if $binding[identifier]['immutable'] == false then
            type = Type.new(value)
            typeOfData = type.checkType()
            typeOfVariable = $binding[identifier]['type']

            if typeOfData == typeOfVariable then
                $binding[identifier]['value'] = value
            else err = ArcticError.new("type #{typeOfData} is not assignalable to type #{typeOfVariable}", "err")
            end
        else err = ArcticError.new($ERR_IMMUT_CONST, "err")
        end
    end
end