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

    def self.force_completion
      begin
        Appscript::app("Pomodoro").force_completion
      rescue Exception => e
        puts "Error completing Pomodoro"
        puts e.message
        puts e.backtrace.inspect
      end  
    end
  end
end
