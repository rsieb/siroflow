
module RoutineTracker

  class Terminal

    def initialize
      # Store the state of the terminal
      stty_save = `stty -g`.chomp
      # Allow for user cancellations without generating an exception
      @terminal = trap('INT') { system('stty', stty_save); exit }
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
      puts(printable)  
    end
    
    def ask(instruction, prompt)
      @@instance.notify(instruction)
      Readline.readline(prompt, true)
    end

    def say(saying)
      system("/usr/local/bin/growlnotify -p 0 -m \"#{saying}\" ")
      unless @@instance.silent?
        system("say #{saying}")
      end
    end
    
    def shout(saying)
      @@instance.notify(saying)
      @@instance.say(saying)
    end
    

    def self.chaseup(sayable)
      @@instance.say("Work on #{sayable}")
      sleep 2
      system("open -a ScreenSaverEngine")
      f = File.open("/tmp/routinetracker.log", "a")
      f.write("#{IDLEMARKER}")
      f.close
    end

    def self.remind(sayable)
      @@instance.say(sayable)
    end

    def welcome(software)
      #ψ Clear screen and welcome user
      print "\e[H\e[2J"
      puts "\nWelcome to #{software}!\n"
      @@instance.say "Welcome!"
    end
    
    private_class_method :new
  end

end