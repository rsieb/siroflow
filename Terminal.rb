# encoding: utf-8
require 'LOGGER'

# RoutineTracker is the overall module for this project.
module RoutineTracker


  # temporary class for addressing the user terminal
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
      @terminal
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
      # FIXED 201111210912 remodel these into DEBUG, INFO,
      # WARN, ERROR and FATAL messages
      @@instance.info(notification)
    end

    def self.chaseup(tasklist)
      # TODO: 2012-04-08 normalize ugly code at self.chaseup in proper objects
      begin
        minutesidle = IO.readlines("/tmp/routinetracker.log").last.scan('*').size
      rescue
        minutesidle = 1
      end
      LOGGER.debug "minutesidle = #{minutesidle}"
      if Log.instance.idle?
        LOGGER.debug "Instance is idle"
        minutesidle.times { |i|
          if i > (minutesidle - 10)
            @@instance.warn("#{speakstring} ")
            LOGGER.debug "Warning time #{i}"
          end
        }
        # @toptask = tasklist.gsub(/\n.*$/,"")
        # #        @@instance.warn("#{minutesidle.to_s} ")
        # @@instance.warn("#{@toptask} ")
        f = File.open("/tmp/routinetracker.log", "a")
        LOGGER.debug "File is opened #{f.class}"
        f.write("#{IDLEMARKER}")
        f.close
        LOGGER.debug "Ready to open PromptForPomodoro #{minutesidle}"
        output = system "osascript /Users/rs/Dropbox/Library/Scripts/Applications/Pomodoro/PromptForPomodoro.scpt #{minutesidle}"
        LOGGER.info "Output is #{output.inspect}"
        #system("open -a 'NVAlt' '/Users/rs/Dropbox/Elements/Todyn.txt'")
        # @@instance.warn("#{Time.now.strftime('%H %M')} ")
        # DONE rs 2012-07-29 solved major risk: sending an array full of random commands into system as text?
      end
    end

    def speakstring(_int)
      alphabet = %w/ alpha bravo charlie delta echo foxtrot golf hotel India juliett kilo lima mike November oscar papa quebec romeo sierra tango uniform victor x-ray yankee zulu /
      _int <= 26 ? alphabet[_int - 1] : _int.to_s
    end

    def self.remind(sayable)
      @@instance.info "#{sayable}"
    end

    def welcome(software)
      #ψ Clear screen and welcome user
      print "\e[H\e[2J"
      puts "\nWelcome to #{software}!\n"
      @@instance.say "Welcome!"
    end

    protected

    def say(saying)
      saying.gsub!(/\+*$/, '') #thought it would only take the +goal out but it also does the ®routine. weird. 2012-11-01
      unless @@instance.silent?
        @voice = %w(Alex Vicki Kathy Victoria Alex Bruce Fred).sample
        system("say -v #{@voice} #{saying}")
      end
    end

    private_class_method :new
  end

end
