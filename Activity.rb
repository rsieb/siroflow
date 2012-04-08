module RoutineTracker
  class Activity

    def self.target
      begin
        return currentappt = system("tail -n 1 /tmp/starredtasks.txt")
      rescue
        return "Restar Final Version"
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