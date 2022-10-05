$stringType = /A-Za-z_/
$numberType = /0-9/

$STRING = "string"

class Type
    def initialize(arg)
        @arg = arg
    end

    def checkType()
        puts @arg
        if @arg.match($stringType) then
            return $STRING
        end
    end
end