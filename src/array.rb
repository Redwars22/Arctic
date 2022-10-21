=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

require "./data.rb"

class ArcticArray
    def initialize(statement)
        if statement then
            @statement = statement
        end
    end

    def createArray()
        @statement = @statement.split($ASSIGN)
        tokens = @statement
        identifier = tokens[0]
        identifier[$ARRAY] = ""
        identifier = identifier.strip()
        data = tokens[1]

        data[$ARRAY_START] = ""
        data[$ARRAY_END] = ""
        data = data.split($ARRAY_EL_SEPARATOR)

        #
        #   if bind.searchInBindings(identifier) then
        #       err = ArcticError.new($ERR_EL_ALREADY_EXISTS, "err")
        #   end
        #

        $binding[identifier] = {
            "type" => "array",
            "value" => data,
            "immutable" => nil
        }
    end

    def queryElementByIndex()
    end

    def getArray()
    end

    def pushElement()
    end

    def popElement()
    end
end