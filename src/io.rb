require "./types.rb"

$printKeyword = "display "

class Input
end

class Output
    def initialize(arg)
        @arg = arg
    end

    def exec()
        typeChecker = Type.new(@arg)
        puts typeChecker.checkType

        puts @arg
    end
end