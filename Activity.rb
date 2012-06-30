module RoutineTracker
  class Activity

    def self.target
      tasks = Array.new()
      nowtask = ""
      begin
        tasks.push(%x[/Users/rs/Dropbox/Library/Scripts/geektool/currentevents.sh].chomp!)
      rescue
        tasks.push("--No active event or ical error--")
        tasks.push("Fuck yeah restar my tasklist ®restar +0pvy")
      end
      begin
        tasks.push(IO.readlines("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt").last.chop.to_s)
      rescue
        tasks.push("--No starred tasks or Toodledo error--")
      end
      tasks.size.times do
        addtask = tasks.delete_at(rand(tasks.size))
        if addtask then
          nowtask = nowtask + addtask  + "\n"
        end
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

