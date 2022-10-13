=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

$ERR_TYPE_MISMATCH = "type mismatch"
$ERR_BINDING_NOT_FOUND = "variable or constant not found"
$ERR_IMMUT_CONST = "you cannot change the value of a constant"

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