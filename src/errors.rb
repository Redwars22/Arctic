$ERR_TYPE_MISMATCH = "type mismatch"

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