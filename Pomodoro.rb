module RoutineTracker

  class Pomodoro

    def self.start(activity)
      begin
        Appscript::app("Pomodoro").start("#{activity} ", :duration => 60)
      rescue Exception => e
        puts "Error starting Pomodoro"
        puts e.message
        puts e.backtrace.inspect
      end  
    end

  end
end
