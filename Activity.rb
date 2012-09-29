#!/usr/bin/env ruby -wKu
# encoding: UTF-8

module RoutineTracker
  class Activity

    def self.target
      tasks = Array.new()
      nowtask = ""

      taken = IO.readlines("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt")
      unless !taken
        taken.each do |taak|
          tasks.push(taak.chop.to_s)
        end
      end

      evenementen = %x[/Users/rs/Dropbox/Library/Scripts/geektool/currentevents.sh].chomp!
      unless !evenementen
        evenementen.each_line do |taak|
          unless taak.match(/^»/) 
            tasks.push(" " + taak.to_s)
          end
        end
      end

      if tasks
        tasks.each do |addtask|
          nowtask = addtask + "\n" + nowtask
        end
      else
        nowtask = "--no tasks found--"
      end
      return nowtask
    end

    def self.idle?(summary)
      if ( summary.match("#Break#").to_s.size > 0 && Time.now() - File.mtime(LOGFILE) > 1800 )
        f = File.open(LOGFILE, "w+")
          f.write("IDLE!")
        f.close
      end
      summary.match("IDLE").to_s.size > 0
    end

    def self.actual
      Log.instance.contents.split(' +')[0]
    end

  end
end

