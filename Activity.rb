module RoutineTracker
  class Activity

    def self.target
      begin
        return IO.readlines("/tmp/starredtasks.txt").last.chop.to_s
      rescue
        return "Next task?"
      end
    end

    def self.idle?(summary)
      summary.match("IDLE").to_s.size > 0
    end

    def self.actual
      Log.instance.contents.split(' #')[0]
    end

  end
end