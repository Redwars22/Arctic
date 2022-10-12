require "./io.rb"
require "./rules.rb"
require "./data.rb"

$currentLine = 0

def parse(line)
    if (line.match(/exec .*[A-Za-z]\.ice/)) then
        $currentLine = 0
        filename = line
        filename["exec "] = ""
        file = File.new(filename.strip(), "r")
        code = file.readlines()
        index = 0

        while index < code.length do
            if(code[index] != "")
                parse(code[index].strip())
            end

            index += 1
            $currentLine = index
        end

        return
    end

    if line == "" then
        return
    end

    if (line.match($codeBlock) or line == "}") then
        puts "block found"
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

    if (line.match($declarationStatement)) then
        data = ArcticBinding.new(line)
        data.create()
        return
    end

    if (line.match($stopCommand) || (line.match($returnCommand))) then
        exit
    end

    if (line.match($singleLineComment)) then
        return
    end

    if (line.match(/var_dump/)) then
        puts $binding
        return
    end

    err = ArcticError.new("invalid command found at line #{$currentLine + 1}}", "err")
end