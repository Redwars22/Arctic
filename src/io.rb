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
        #It checks if the variable exists and is not a constant
        bindings = ArcticBinding.new(nil)
        variable = bindings.searchInBindings(@arg)
        
        if variable then
            if !variable["immutable"] then
                #it checks the type of the user input and,
                #if it matches the type of the variable,
                #it's then stored there
                userInput = gets
                typeChecker = Type.new(userInput)
                type = typeChecker.checkType()
                #puts "#{type} = #{variable}"

                if type == variable["type"] then
                    $binding[@arg]["value"] = userInput.strip
                else err = ArcticError.new($ERR_TYPE_MISMATCH, "err")
                end
            end
        end
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

        if(type == "var_const") then
            bindings = ArcticBinding.new(nil)
            data = bindings.searchInBindings(@arg)
            puts data["value"]
            return
        end

        puts @arg
    end
end