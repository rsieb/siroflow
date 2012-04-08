
module RoutineTracker

  class Terminal

    def initialize
      begin
        # Store the state of the terminal
        stty_save = `stty -g`.chomp
        # Allow for user cancellations without generating an exception
        @terminal = trap('INT') { system('stty', stty_save); exit }
      rescue
        @terminal = "hello"
      end
    end

    @@instance = Terminal.new

    def self.instance
      return @@instance
    end

    def silent?
      @@silent = File.exist?("/Users/rs/Desktop/silent")
      return @@silent
    end

    def notify(printable)
      @@instance.info(printable)  
    end

    def shout(saying)
      @@instance.warn(saying)
    end

    def ask(instruction, prompt)
      @@instance.notify(instruction)
      Readline.readline(prompt, true)
    end

    def debug(msg)
      puts msg
      system("/usr/local/bin/growlnotify -p 'Very Low' -m \"#{msg}\" ")
    end

    def info(msg)
      puts msg
      system("/usr/local/bin/growlnotify -p 'Moderate' -m \"#{msg}\" ")
    end

    def warn(msg)
      puts msg
      system("/usr/local/bin/growlnotify -p 'Normal' -m \"#{msg}\" ")
      @@instance.say(msg)
    end

    def error(msg)
      puts msg
      system("/usr/local/bin/growlnotify -p 'High' -m \"#{msg}\" ")
      @@instance.say(msg)
    end

    def fatal(msg)
      puts msg
      system("/usr/local/bin/growlnotify -p 'Emergency' -m \"#{msg}\" ")
      @@instance.say(msg)
    end

    def display(notification)
      # FIXED 201111210912 remodel these into DEBUG, INFO, WARN, ERROR and FATAL messages
      @@instance.info(notification)
    end

    def self.chaseup(sayable)
      #TODO 2012-04-08 normalize ugly code at self.chaseup in proper objects
      begin
        minutesidle =  IO.readlines("/tmp/routinetracker.log").last.chop.to_s.size
      rescue
        minutesidle = "some"
      end
      @@instance.warn("#{minutesidle} minutes idle. #{sayable}?")
      sleep 1
      #      system("/usr/bin/osascript /Users/rs/Dropbox/Library/Scripts/Applications/iCal/pull_unfinished_plans.scpt")
      f = File.open("/tmp/routinetracker.log", "a")
      f.write("#{IDLEMARKER}")
      f.close
      #system("pmset sleepnow")
      system('open -a "ScreenSaverEngine.app" ')
    end

    def self.remind(sayable)
      @@instance.display(sayable)
      #@@instance.say(sayable)
    end

    def welcome(software)
      #ψ Clear screen and welcome user
      print "\e[H\e[2J"
      puts "\nWelcome to #{software}!\n"
      @@instance.say "Welcome!"
    end

    protected

    def say(saying)
      unless @@instance.silent?
        system("say #{saying}")
      end      
    end

    private_class_method :new
  end

end