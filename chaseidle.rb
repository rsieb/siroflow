#!/usr/bin/env ruby -wKu
# encoding: UTF-8
 
unless IO.readlines("/tmp/routinetracker.log").first.match("PREZMODE").to_s.size > 0
  require 'rubygems'
  require '/Users/rs/rt/Terminal.rb'
  require '/Users/rs/rt/Log.rb'
  require '/Users/rs/rt/Activity.rb'
  require '/Users/rs/rt/Pomodoro.rb'

  TODOLIST = `/Users/rs/rt/starredtasks.rb`
  unless TODOLIST.size < 3 # means no real output from process
    puts "TODOLIST exists"
    f = File.open("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt", "w")
    f.write("#{TODOLIST}")
    f.close
  else
    puts "TODOLIST is empty"
  end 
  system("/usr/bin/env ruby /Users/rs/Dropbox/Library/Scripts/Routinetracker/starredtasks.rb > /Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt ")
  module RoutineTracker
    class Main < Activity
      unless Terminal.instance.silent?
        if idle?(actual) 
          Terminal.chaseup(target)      
        else
          Terminal.remind(actual)
        end
      end
    end
  end
end
