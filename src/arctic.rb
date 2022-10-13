=begin
  + ------------------------------------------ +
  | (c) 2022 - André Pereira (AndrewNation)    |
  | This piece of software is open source and  |
  | subject to the GNU General Public License  |
  + ------------------------------------------ +
=end

puts "Welcome to Arctic - a programming language written in Ruby"

require "./parse.rb"
require "./rules.rb"

while true do
  print "🧊: "
  command = gets

  parse(command)
end