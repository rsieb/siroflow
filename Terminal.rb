# encoding: utf-8
# require 'Logger'

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

    @@instance = self.new

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
      #system("/usr/local/bin/growlnotify -p 'Moderate' -m \"#{msg}\" ")
    end

    def warn(msg)
      puts "\a" + msg
      @@instance.say(msg)
      system("/usr/local/bin/growlnotify -p 'Normal' -m \"#{msg}\" ")
    end

    def error(msg)
      puts "\a\a\a" + msg
      @@instance.say(msg)
      system("/usr/local/bin/growlnotify -p 'High' -m \"#{msg}\" ")
    end

    def fatal(msg)
      puts "\a\a\a\a\a" + msg
      @@instance.say(msg)
      system("/usr/local/bin/growlnotify -p 'Emergency' -m \"#{msg}\" ")
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
        # if minutesidle > 20
        #   system(%q(osascript -e 'tell application "Finder" to sleep'))
        # else
        minutesidle.times { |i|
          if i > (minutesidle - 10)
            system("say #{i.to_s} ")
            LOGGER.debug "Warning time #{i}"
          end
        }
        # end
        # @toptask = tasklist.gsub(/\n.*$/,"")
        # #        @@instance.warn("#{minutesidle.to_s} ")
        # @@instance.warn("#{@toptask} ")
        f = File.open("/tmp/routinetracker.log", "a")
        LOGGER.debug "File is opened #{f.class}"
        f.write("#{IDLEMARKER}")
        f.close
        LOGGER.debug "Ready to open PromptForPomodoro #{minutesidle}"
        output = system "osascript /Users/rs/rt/prompt_for_pomodoro_2.scpt #{minutesidle}"
        LOGGER.info "Output is #{output.inspect}"
        system('/Users/rs/rt/auto_update_todyn.sh')

        #system("open -a 'NVAlt' '/Users/rs/Dropbox/Elements/Todyn.txt'")
        # @@instance.warn("#{Time.now.strftime('%H %M')} ")
        # DONE rs 2012-07-29 solved major risk: sending an array full of random commands into system as text?
      end
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
