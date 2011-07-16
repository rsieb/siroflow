#!/usr/bin/env ruby

require '/Users/rs/Dropbox/Library/Scripts/Routinetracker/_routine_methods.rb'

class Main
  begin
    f = File.open("/tmp/routinetracker.log", "r")
    line = f.gets
    f.close
  rescue
    f = File.new("/tmp/routinetracker.log", "w+")
    f.puts("IDLE man!")
    retry
  end

  #puts "The string is $#{line}$"
  testwaarde = line.match("IDLE").to_s
  if testwaarde == "IDLE" then
#    system("/usr/local/bin/growlnotify -p 4 -m 'IDLE' ")    
    system("/usr/local/bin/growlnotify -p 5 #{line} ")    
    unless File.exist?("/Users/rs/Desktop/silent") then
      system("say #{line}")
    end
  else
    #firstword = line.split(/ /)[0]
    #system("/usr/local/bin/growlnotify -p 0 -m #{firstword} ")    
    system("/usr/local/bin/growlnotify -p 0 -m #{line} ")    
  end

end

