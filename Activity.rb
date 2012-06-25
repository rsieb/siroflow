# encoding: utf-8

module RoutineTracker
  class Activity

    def self.target
      begin
        nowtask1 = %x[/Users/rs/Dropbox/Library/Scripts/geektool/currentevents.sh].chomp!
        nowtask2 = IO.readlines("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt").last.chop.to_s
        nowtask = nowtask1 + "\n" + nowtask2
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

