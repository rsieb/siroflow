module RoutineTracker
  class Activity

    def self.target
      tasks = Array.new()
      nowtask = ""
      tasks.push(%x[/Users/rs/Dropbox/Library/Scripts/geektool/currentevents.sh].chomp!)
      tasks.push(IO.readlines("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt").last.chop.to_s)
      tasks.size.times do
        nowtask = nowtask + tasks.delete_at(rand(tasks.size)) + "\n"
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

