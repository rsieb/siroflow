# encoding: utf-8

module RoutineTracker
  class Activity

    def self.target
      begin
        icaltask = %x[/Users/rs/Dropbox/Library/Scripts/geektool/currentevents.sh].chomp!
        if ( !icaltask || rand() > 0.667)
          nowtask = IO.readlines("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt").last.chop.to_s
          #        system("echo '#{nowtask}\n' | pbcopy -Prefer txt")
          return nowtask
        else
          nowtask = icaltask
        end
      rescue
        nowtask = "Next task"
      end
      return nowtask
    end

    def self.idle?(summary)
      summary.match("IDLE").to_s.size > 0
    end

    def self.actual
      Log.instance.contents.split(' #')[0]
    end

  end
end

