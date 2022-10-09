require "./errors.rb"

$stringType = /\"(.*[A-Za-z_0-9])\"/
$numberType = /.*[0-9]/

$STRING = "string"
$NUMBER = "number"

class Type
    def initialize(arg)
        @arg = arg
    end

    def checkType()
        if @arg.match($stringType) then
            return $STRING
        end

        if @arg.match($numberType) then
            return $NUMBER
        end

        err = ArcticError.new("invalid argument", "err")
    end
end