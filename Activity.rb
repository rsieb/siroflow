#!/usr/bin/env ruby -wKu
# encoding: UTF-8

#TODOYFILE="/Users/rs/Library/Application Support/Notational Data/Todoy.txt"
TODOYFILE="/Users/rs/Dropbox/Elements/Todoy.txt"

module RoutineTracker
  class Activity

    def self.targetfile
      return TODOYFILE
    end

    # def self.target
    #   tasks = Array.new()
    #   nowtask = ""

    #   taken = IO.readlines(TODOYFILE)
    #   unless !taken
    #     taken.each do |taak|
    #       tasks.push(taak.chop)
    #     end
    #   end

    #   if tasks
    #     tasks.each do |addtask|
    #       nowtask = nowtask + addtask  + "\n"
    #     end
    #     # nowtask = nowtask + "." + tasks[0]
    #   end
    #   return nowtask
    # end

    def self.idle?(summary)
      if ( summary.match("#Break#").to_s.size > 0 && Time.now() - File.mtime(LOGFILE) > 1800 )
        # # override pauses longer than x seconds, also catches when Pomodoro forgets to write "IDLE again"
        # if ( Time.now() - File.mtime(LOGFILE) > 600 )

        f = File.open(LOGFILE, "w+")
        f.write("IDLE!")
        f.close
      end
      if ( summary.match("PREZMODE").to_s.size > 0 && Time.now() - File.mtime(LOGFILE) > 5400 )
        # # override pauses longer than x seconds, also catches when Pomodoro forgets to write "IDLE again"
        # if ( Time.now() - File.mtime(LOGFILE) > 600 )

        f = File.open(LOGFILE, "w+")
        f.write("IDLE!")
        f.close
      end
      summary.match("IDLE").to_s.size > 0
    end
    #end

    def self.actual
      Log.instance.contents.split(' +')[0]
    end

  end
end
