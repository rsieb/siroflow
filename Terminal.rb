#!/usr/bin/env ruby
# encoding: UTF-8

#!/usr/bin/env ruby -wKu

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

    def self.chaseup(tasklist)
      #TODO 2012-04-08 normalize ugly code at self.chaseup in proper objects
      begin
        minutesidle =  IO.readlines("/tmp/routinetracker.log").last.chop.to_s.size - 2
      rescue
        minutesidle = "some"
      end
#      system('osascript -e "if (get (output muted of (get volume settings))) is false then set volume output volume ((output volume of (get volume settings)) + 1)" ')
      system('osascript -e "set volume without output muted output volume ((output volume of (get volume settings)) + 1)" ')
      minutesidle.times { |i|
        if Log.instance.idle?
          @@instance.warn("#{i.to_s} ")
        end
      }
      #      @@instance.warn("#{tasklist.split(/ \+/u)[0]} ")
      if Log.instance.idle?
        @toptask = tasklist.gsub(/\n.*$/,"")
        @@instance.warn("#{@toptask} ")
        # TODO rs 2012-07-29 this is a major risk: sending an array full of random commands into system as text?
        system('osascript /Users/rs/Dropbox/Library/Scripts/Applications/Pomodoro/PromptForPomodoro.scpt "' + tasklist +'"')
#        system("osascript /Users/rs/Dropbox/Library/Scripts/Applications/Pomodoro/PromptForPomodoro.scpt #{tasklist} ")
        f = File.open("/tmp/routinetracker.log", "a")
        f.write("#{IDLEMARKER}")
        f.close
      end
    end

    def self.remind(sayable)
      @@instance.info(sayable)
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