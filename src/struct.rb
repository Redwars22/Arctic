=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

require "./parse.rb"
require "./operators.rb"
require "./types.rb"
require "./data.rb"

$ifStatement = {"condition" => nil, "execIfTrue" => [], "execIfFalse" => []}

class ArcticStruct
    def initialize()
    end

    def evalCondition(condition)
        condition = condition.split(' ')
        tokens = condition
        token = 0

        while token < tokens.length do
            _token = tokens[token]
            if !_token.match($numberType) and !(_token.match($MATH_OPER)) then
                tokens[token] = $binding[_token]["value"]
            end

            token += 1
        end

        condition = tokens.join('')

        if eval(condition) then
            return true
        end

        return false
    end

    def handleIfStatement()
        condition = $ifStatement["condition"].strip()
        
        if evalCondition(condition) then
            i = 0

            while i < $ifStatement["execIfTrue"].length do
                parse($ifStatement["execIfTrue"][i])
                i += 1
            end
        end

        $ifStatement["condition"] = nil
        $ifStatement["execIfTrue"] = []
        $ifStatement["execIfFalse"] = []
    end
end