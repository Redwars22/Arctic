require "./rules.rb"

printFunction = /print .*[\"\"A-Za-z0-9!]/

def parse(line)
    if (line.match(/print .*[\"\"A-Za-z0-9!]/)) then
        statement = line
        statement["print "] = ""
        puts statement
    end
  
    #if (line.match(/exit/)) then
    #  isRunning = false
    #end
  end