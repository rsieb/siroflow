#!/usr/bin/env ruby

require '/Users/rs/Dropbox/Library/Scripts/Routinetracker/_routine_methods.rb'

if File.exist?("/Users/rs/Desktop/silent") then
  stil = true
else
  stil = false
end

File.open("/tmp/routinetracker.log", "r")  do |f|
  while (line = f.gets)
    # puts "The string is $#{line}$"
    testwaarde = line.match("IDLE").to_s
    if testwaarde == "IDLE" then
      system("/usr/local/bin/growlnotify -p 0 -m \"IDLE\" ")
      unless stil 
        say("IDLE")
      end
    else
      tijdmelding = Time.now().strftime("%H:%M:%S")
      system("/usr/local/bin/growlnotify -p 0 -t \"#{tijdmelding}\" -m \"#{line}\" ")
      firstword = line.split(/ /)[0]
      unless stil 
        say(firstword)
      end
    end
  end
  f.close
end
# 
# 
# 
# file = File.new("readfile.rb", "r")
#    9:while (line = file.gets)
#   10:    puts "#{counter}: #{line}"
#   11:    counter = counter + 1
#   12:end
#   13:file.close