module RoutineTracker

  class Pomodoro

    def start(activity,duration=25)
      begin
        Appscript::app("Pomodoro").start("#{@activity} ", :duration => duration)
      rescue Exception => e
        puts "Error starting Pomodoro"
        puts e.message
        puts e.backtrace.inspect
      end  
    end

  end
end
