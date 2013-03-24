#!/usr/bin/env ruby -wKu
# encoding: UTF-8

#TODOYFILE="/Users/rs/Library/Application Support/Notational Data/Todoy.txt"
TODOYFILE="/Users/rs/Dropbox/Elements/Todoy.txt"

module RoutineTracker
  class Activity

    def self.target
      tasks = Array.new()
      nowtask = ""

      #taken = IO.readlines("/Users/rs/Library/Application Support/Notational Data/starredtasks.txt")
      taken = IO.readlines(TODOYFILE)
      unless !taken
        taken.each do |taak|
          tasks.push(taak.chop)
        end
      end

      if tasks
        tasks.each do |addtask|
          nowtask = nowtask + addtask  + "\n"
        end
        # nowtask = nowtask + "." + tasks[0]
      end
      # 
      # File.open(TODOYFILE, 'w') {|f| f.write(nowtask) }
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

