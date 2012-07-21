# encoding: UTF-8

module RoutineTracker
  class Activity

    def self.target
      tasks = Array.new()
      nowtask = ""
      # begin
        evenementen = %x[/Users/rs/Dropbox/Library/Scripts/geektool/currentevents.sh].chomp!
        evenementen.each_line do |taak|
          tasks.push("." + taak.chop.to_s)
        end
      # rescue
      #   tasks.push("--No active event or ical error--")
      # end
      # begin
        IO.readlines("/Users/rs/Dropbox/Library/Scripts/geektool/starredtasks.txt").last(3).each do |taak|
          tasks.push(":" + taak.chop.to_s)
        end
      # rescue
      #   tasks.push("--No starred tasks or Toodledo error--")
      # end
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

