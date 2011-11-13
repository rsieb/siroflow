#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require 'appscript'
require '/Users/rs/Dropbox/Library/Scripts/Routinetracker/_routine_methods.rb'


module IdleChaser
  ACTIVITYFILE = "/tmp/routinetracker.log"
  IDLEMARKER = "•"

  class Terminal

    def initialize
      @terminal = "blabla"
    end

    @@instance = Terminal.new

    def self.instance
      return @@instance
    end

    def silent?
      @@silent = File.exist?("/Users/rs/Desktop/silent")
      return @@silent
    end

    def say(saying)
      system("/usr/local/bin/growlnotify -p 0 -m \"#{saying}\" ")
      unless self.silent
        system("say #{saying}")
      end
    end

    def self.chaseup(sayable)
      say("Work on #{sayable}")
      sleep 2
      system("open -a ScreenSaverEngine")
      f = File.open("/tmp/routinetracker.log", "a")
      f.write("#{IDLEMARKER}")
      f.close
    end

    def self.remind(sayable)
      say(sayable)
    end

    private_class_method :new
  end

  class Log

    attr_reader :contents

    def initialize
      unless File.exist?(ACTIVITYFILE)
        f = File.new(ACTIVITYFILE, "w+")
        f.write("IDLE #{IDLEMARKER}")
        f.close        
      end
      @reader = File.open(ACTIVITYFILE, "r")
      @contents = @reader.gets
      @reader.close
    end

    @@instance = Log.new

    def self.instance
      return @@instance
    end

    def idle
      @writer = File.open(ACTIVITYFILE, "a")
      @writer.write("#{IDLEMARKER}")
      @writer.close
    end

  end

  class Activity

    def self.target
      currentappts = Appscript::app("iCal").calendars["Planning"].events.get.find_all{|mtg|
        mtg.start_date.get < Time.now() && mtg.end_date.get > Time.now()
      }
      currentappt = currentappts.first.summary.get
      if ( !currentappt || currentappt == :missing_value )
        return nil
      else
        return currentappt
      end
    end

    def self.idle?(summary)
      summary.match("IDLE").to_s.size > 0
    end

    def self.actual
      Log.instance.contents.split(' #')[0]
    end

  end

  class Main < Activity
    if idle?(actual) 
      Terminal.chaseup(target)
    else
      Terminal.remind(actual)
    end
  end

end