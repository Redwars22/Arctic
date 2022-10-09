require "./io.rb"
require "./rules.rb"
require "./data.rb"

def parse(line)
    if (line.match(/exec .*[A-Za-z]\.ice/)) then
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
        end
    end

    if (line.match($printFunction)) then
        statement = line
        statement[$printKeyword] = ""

        io = Output.new(statement)
        io.exec()
    end

    if (line.match($declarationStatement)) then
        data = ArcticBinding.new(line)
        data.create()
    end

    if (line.match($stopCommand) || (line.match($returnCommand))) then
        exit
    end
end