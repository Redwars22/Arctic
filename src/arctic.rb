puts "Welcome to Arctic - a programming language written in Ruby"

require "./parse.rb"
require "./rules.rb"

isRunning = true

while isRunning do
  print "arctic -$: "
  command = gets

  parse(command)
end
