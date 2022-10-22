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
        @statement = @statement.split("=")
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
        tokens = @statement.split($ARRAY_START)
        identifier = tokens[0]
        identifier[$VAR] = ""
        index = tokens[1]
        index[$ARRAY_END] = ""
        index = index.to_i
        
        if $binding[identifier]['value'][index] then
            return $binding[identifier]['value'][index].strip()
        else err = ArcticError.new($ERR_NOT_FOUND, "err")
        end
    end

    def assignElement()
        tokens = @statement.split($ASSIGN)
        array = tokens[0].split($ARRAY_START)
        identifier = array[0].strip()
        index = array[1].strip()
        index[$ARRAY_END] = ""
        value = tokens[1]

        $binding[identifier]['value'][index.to_i] = value
        return
    end

    def getArray()
    end

    def pushElement()
    end

    def popElement()
    end
end