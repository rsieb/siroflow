#!/usr/bin/env ruby

require '/Users/rs/Dropbox/Library/Scripts/Routinetracker/_routine_methods.rb'

class Main
  begin
    f = File.open("/tmp/routinetracker.log", "r")
    line = f.gets
    f.close
  rescue
    f = File.new("/tmp/routinetracker.log", "w+")
    f.write("IDLE •")
    retry
  end

  #puts "The string is $#{line}$"
  testwaarde = line.match("IDLE").to_s
  puts line
  puts testwaarde

 if testwaarde == "IDLE" then
   #    system("/usr/local/bin/growlnotify -p 4 -m 'IDLE' ")    
   system("/usr/local/bin/growlnotify -p 5 -t 'Superfocus' -m '#{line}' ")    
   sleep 1
   system("open -a ScreenSaverEngine")
   f = File.open("/tmp/routinetracker.log", "a")
   f.write("•")
   f.close
   unless File.exist?("/Users/rs/Desktop/silent") then
     system("say #{line}")
   end
 else
   sayable = line.split(/\#/)[0]
   system("/usr/local/bin/growlnotify -p 0 -t 'Superfocus' -m '#{sayable}' ")    
   # unless File.exist?("/Users/rs/Desktop/silent") then
   #   system("say '#{sayable}'")
   # end
 end

end

