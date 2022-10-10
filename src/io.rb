require "./types.rb"

$printKeyword = "display "
$promptKeyword = "prompt "

class Input
    def initialize(arg)
        #arg represents the name of the variable
        #where the user input will be saved to
        @arg = arg
    end

    def exec()
        #it checks the type of the user input and,
        #if it matches the type of the variable,
        #it's then stored there
        input = gets
        puts input
    end
end

class Output
    def initialize(arg)
        @arg = arg
    end

    def exec()
        typeChecker = Type.new(@arg)
        type = typeChecker.checkType

        if(type == "math_expr") then
            puts eval(@arg)
            return
        end

        puts @arg
    end
end