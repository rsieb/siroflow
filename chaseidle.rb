#!/usr/bin/env ruby -wKU
# encoding: UTF-8


#unless FileTest.exists?("/Users/rs/Desktop/PREZMODE")
unless IO.readlines("/tmp/routinetracker.log").first.match("PREZMODE").to_s.size > 0

  system("/usr/bin/env ruby /Users/rs/Dropbox/Library/Scripts/Geektool/starredtasks.rb > /Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt")
#  system("/usr/bin/open /Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt")
  require 'rubygems'
  #require 'appscript'
  #require_relative '_routine_methods'
  require '/Users/rs/rt/Terminal.rb'
  require '/Users/rs/rt/Log.rb'
  require '/Users/rs/rt/Activity.rb'
  require '/Users/rs/rt/Pomodoro.rb'



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
