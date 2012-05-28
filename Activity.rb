# encoding: utf-8

module RoutineTracker
  class Activity

    def self.target
      begin
        nowtask = IO.readlines("/tmp/starredtasks.txt").last.chop.to_s
        system("echo '#{nowtask}\n' | pbcopy -Prefer txt")
        return nowtask
      rescue
        return "Re-star ToodleDo ®restar _prod"
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

