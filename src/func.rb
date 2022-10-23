=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

$functions = {}

class ArcticFunction
    def declareFunction(statement)
        @statement = statement
        @statement['function '] = ""
        @statement['{'] = ""
        identifier = @statement.strip()
        $functions[identifier] = []
        return identifier
    end

    def execFunction(identifier)
        len = $functions[identifier].length
        instructions = $functions[identifier]
        command = 0

        while command < len do
            parse(instructions[command].strip())
            command += 1
        end
    end
end