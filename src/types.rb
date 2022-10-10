require "./errors.rb"

$stringType = /\"(.*[A-Za-z_0-9])\"/
$numberType = /.*[0-9]/
$logicType = /.*[yesno]/
$arrayType = /.*[\[A-Za-z_0-9\"\]]/
$mathType = /.*[0-9\+\-\*\/\=]/

$STRING = "string"
$NUMBER = "number"
$BOOLEAN = "logic"
$ARRAY = "array"
$MATH_EXPR = "math_expr"

class Type
    def initialize(arg)
        @arg = arg
    end

    def checkType()
        if @arg.match($mathType) then
            return $MATH_EXPR
        end
        
        if @arg.match($stringType) then
            return $STRING
        end

        if @arg.match($numberType) then
            return $NUMBER
        end

        if @arg.match($logicType) then
            return $BOOLEAN
        end

        if @arg.match($arrayType) then
            return $ARRAY
        end

        err = ArcticError.new("invalid argument", "err")
    end
end