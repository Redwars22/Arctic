=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

require "./io.rb"
require "./rules.rb"
require "./data.rb"
require "./array.rb"
require "./struct.rb"
require "./operators.rb"

$currentLine = 0

def parse(line)
    if line.include?(";") then
        line[";"] = ""
    end

    if (line.match(/exec .*[A-Za-z]\.ice/)) then
        $currentLine = 0
        filename = line
        filename["exec "] = ""
        file = File.new(filename.strip(), "r")
        code = file.readlines()
        index = 0
        isMultiLineComment = false
        isIfStatement = false

        while index < code.length do
            if(code[index].include?("/*"))
                isMultiLineComment = true
            end

            if(code[index].include?("*/"))
                index += 1
                isMultiLineComment = false
            end

            if(code[index] != "" and !isMultiLineComment and !isIfStatement)
                parse(code[index].strip())
            end

            if (code[index].match($ifStatementRule)) then
                code[index]["if "] = ""
                code[index]["{"] = ""
                $ifStatement['condition'] = code[index]
                if_struct = ArcticStruct.new()
                isIfStatement = true
                index += 1
            end

            if (isIfStatement && code[index].include?($STATEMENT_BLOCK_END)) then
                if_struct.handleIfStatement
                isIfStatement = false
            end

            if isIfStatement then
                $ifStatement["execIfTrue"].push(code[index].strip)
            end

            index += 1
            $currentLine = index
        end

        return
    end

    if line == "" then
        return
    end

    if (line.match($singleLineComment)) then
        return
    end

    if (line.match($ifStatementRule)) then
        return
    end

    if (line.match($codeBlock) or line == "}") then
        return
    end
    
    if (line.match($printFunction)) then
        statement = line
        statement[$printKeyword] = ""

        io = Output.new(statement)
        io.exec()
        return
    end

    if (line.match($promptFunction)) then
        statement = line
        statement[$promptKeyword] = ""

        io = Input.new(statement)
        io.exec()
        return
    end

    if (line.match($arrayStatement)) then
        array = ArcticArray.new(line)
        array.createArray()
        return
    end

    if (line.match($arrayAssignStatement)) then
        array = ArcticArray.new(line)
        array.assignElement()
        return
    end

    if (line.match($declarationStatement)) then
        data = ArcticBinding.new(line)
        data.create()
        return
    end

    if (line.match($assignTo)) then
        data = ArcticBinding.new(nil)
        data.assignToVariable(line)
        return
    end

    if (line.match($stopCommand) || (line.match($returnCommand))) then
        puts "The program has exited"
        exit
    end


    if (line.match(/var_dump/)) then
        puts $binding
        return
    end

    if (line.match($awaitFunction)) then
        puts "Press enter to continue..."
        key = gets
        return
    end

    if (line.match($deleteFunction)) then
        data = ArcticBinding.new(nil)
        line["destroy "] = ""
        identifier = line
        data.deleteBindings(identifier) 
        return
    end

    err = ArcticError.new("invalid command found at line #{$currentLine + 1}}", "err")
end