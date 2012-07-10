
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
      puts "\a" + msg
      system("/usr/local/bin/growlnotify -p 'Normal' -m \"#{msg}\" ")
      @@instance.say(msg)
    end

    def error(msg)
      puts "\a\a\a" + msg
      system("/usr/local/bin/growlnotify -p 'High' -m \"#{msg}\" ")
      @@instance.say(msg)
    end

    def fatal(msg)
      puts "\a\a\a\a\a" + msg
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
        minutesidle =  IO.readlines("/tmp/routinetracker.log").last.chop.to_s.size - 2
      rescue
        minutesidle = "some"
      end
      #minutesidle.to_i.times {|i| @@instance.warn("#{minutesidle} ") }
      minutesidle.times { |i|
#        @@instance.warn("idle ")
        @@instance.warn("#{i.to_s} ")
      }
      @@instance.warn("#{sayable} ")
      #minutesidle.to_i.times {|i| printf "\a" ; sleep 0.2 }
      system('osascript -e "tell app \"System Events\" to set the visible of every process to false" ')
      system('osascript /Users/rs/Dropbox/Library/Scripts/Applications/Pomodoro/PromptForPomodoro.scpt "' + sayable +'"')
      #sleep 1
      #      system("/usr/bin/osascript /Users/rs/Dropbox/Library/Scripts/Applications/iCal/pull_unfinished_plans.scpt")
      f = File.open("/tmp/routinetracker.log", "a")
      f.write("#{IDLEMARKER}")
      f.close
      #system('osascript /Users/rs/Dropbox/Library/Scripts/CloseUnused.scpt ')
      #system('open -a "ToodleDo.app" ')
      #system('open -a "Isolator.app" ')
      #system('open -a "ScreenSaverEngine.app" ')
      #system("pmset sleepnow") # avoid this, very hard to get going again
      #system("/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend") # does not seem to work from ruby script
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