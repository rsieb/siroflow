
module RoutineTracker

  class Terminal

    def initialize
      @terminal = "blabla"
    end

    @@instance = Terminal.new

    def self.instance
      return @@instance
    end

    def self.silent?
      @@silent = File.exist?("/Users/rs/Desktop/silent")
      return @@silent
    end

    def self.say(saying)
      system("/usr/local/bin/growlnotify -p 0 -m \"#{saying}\" ")
      unless Terminal.silent?
        system("say #{saying}")
      end
    end

    def self.chaseup(sayable)
      Terminal.say("Work on #{sayable}")
      sleep 2
      system("open -a ScreenSaverEngine")
      f = File.open("/tmp/routinetracker.log", "a")
      f.write("#{IDLEMARKER}")
      f.close
    end

    def self.remind(sayable)
      Terminal.say(sayable)
    end

    private_class_method :new
  end

end