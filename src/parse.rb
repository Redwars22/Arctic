require "./io.rb"
require "./rules.rb"

def parse(line)
    if (line.match($printFunction)) then
        statement = line
        statement[$printKeyword] = ""

        io = Output.new(statement)
        io.exec()
    end
end