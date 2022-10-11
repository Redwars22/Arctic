$ERR_TYPE_MISMATCH = "type mismatch"
$ERR_BINDING_NOT_FOUND = "variable or constant not found"

class ArcticError
    def initialize(err, type)
        if(type == "err") then
            raise "❌ " + err
        end

        if(type == "warn") then
            raise "⚠️ " + err
        end
    end
end