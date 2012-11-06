#!/usr/bin/env ruby -KU
# encoding: UTF-8

require 'rubygems'
require '/Users/rs/rt/Terminal.rb'
require '/Users/rs/rt/Log.rb'
require '/Users/rs/rt/Activity.rb'
require '/Users/rs/rt/Pomodoro.rb'

LOGFILE = "/tmp/routinetracker.log"

if ( IO.readlines(LOGFILE).first.match("PREZMODE").to_s.size == 0 )
  module RoutineTracker
    class Main < Activity
        if idle?(actual) 
          puts "Chaseup"
          Terminal.chaseup(target)      
        else
          puts "Remind"
          Terminal.remind(actual)
        end
    end
  end
# else
#   if ( Time.now() - File.mtime(LOGFILE) > 7200 )
#     # system("/usr/bin/osascript -f '/Users/rs/Dropbox/Library/Scripts/Mode work.scpt' ")
#     f = File.open(LOGFILE, "w+")
#     f.write("IDLE")
#     f.close
#   end  
end

# 2012-09-09 this is double with the system call below. why?  
TODOLIST = `/Users/rs/rt/starredtasks.rb`
unless TODOLIST.size < 3 # means no real output from process
#  puts "TODOLIST exists"
  f = File.open("/Users/rs/Library/Application Support/Notational Data/starredtasks.txt", "w")
  f.write("#{TODOLIST}")
  f.close
else
  puts "TODOLIST is empty"
end 
#system("/usr/bin/env ruby /Users/rs/Dropbox/Library/Scripts/Routinetracker/starredtasks.rb > /Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt ")
