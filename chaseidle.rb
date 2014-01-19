# encoding: utf-8

#!/usr/bin/env ruby -KU
# encoding: UTF-8

require 'rubygems'
require '/Users/rs/rt/Terminal.rb'
require '/Users/rs/rt/Log.rb'
require '/Users/rs/rt/Activity.rb'
require '/Users/rs/rt/Pomodoro.rb'
require 'Logger'

LOGGER = Logger.new(STDERR)
LOGGER.level = Logger::DEBUG


# 2012-09-09 this is double with the system call below. why?
# TODOLIST = `/Users/rs/rt/starredtasks.rb`
# unless TODOLIST.size < 3 # means no real output from process
# #  puts "TODOLIST exists"
# puts TODOLIST
#   f = File.open('/Users/rs/Library/Application Support/Notational Data/starredtasks.txt', "w")
#   f.write("#{TODOLIST}")
#   puts "Written to starredtasks.txt"
#   f.close
# else
#   puts "TODOLIST is empty"
# end
#system("/usr/bin/env ruby /Users/rs/Dropbox/Library/Scripts/Routinetracker/starredtasks.rb > /Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt ")


LOGFILE = "/tmp/routinetracker.log"
LOGGER.debug "LOGFILE = #{LOGFILE}"

if ( IO.readlines(LOGFILE).first.match("PREZMODE").to_s.size == 0 )
  LOGGER.debug "PREZMODE not active"
  module RoutineTracker
    class Main < Activity
      LOGGER.debug "actual = #{actual}"
      if idle?(actual)
        LOGGER.debug "idle = true"
        LOGGER.info "Chaseup"
        LOGGER.debug "targetfile = #{targetfile}"
        Terminal.chaseup(targetfile)
      else
        #system("/usr/bin/osascript /Users/rs/Dropbox/Library/Scripts/Applications/Pomodoro/distracting_apps.scpt")
        LOGGER.debug "idle = false"
        LOGGER.info "Remind"
        LOGGER.debug "reminding of  = #{actual}"
        Terminal.remind(actual)
      end
    end
  end
else
  # do nothing for now
  # if ( Time.now() - File.mtime(LOGFILE) > 4000 )
  #   f = File.open(LOGFILE, "w+")
  #   f.write("IDLE")
  #   f.close
  #   system("/usr/bin/osascript -f '/Users/rs/Dropbox/Library/Scripts/Mode work.scpt' ")
  # end
end
