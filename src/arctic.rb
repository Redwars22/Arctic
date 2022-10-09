=begin
  + ------------------------------------------ +
  |
  + ------------------------------------------ +
=end

puts "Welcome to Arctic - a programming language written in Ruby"

require "./parse.rb"
require "./rules.rb"

while true do
  print "arctic -$: "
  command = gets

  parse(command)
end