=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

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
end