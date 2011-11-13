#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require 'appscript'
require '/Users/rs/Dropbox/Library/Scripts/Routinetracker/_routine_methods.rb'


module IdleChaser
  ACIVITYFILE = "/tmp/routinetracker.log"

  class Terminal

    def initialize
    end

    @@instance = Terminal.new

    def self.instance
      return @@instance
    end

    def self.silent?
      @@silent File.exist?("/Users/rs/Desktop/silent")
    end

    def self.say(saying)
      system("/usr/local/bin/growlnotify -p 0 -m \"#{saying}\" ")
      unless self.silent
        system("say #{saying}")
      end
    end

    def self.chaseup(sayable)
      say(sayable)
      sleep 2
      system("open -a ScreenSaverEngine")
      f = File.open("/tmp/routinetracker.log", "a")
      f.write("*")
      f.close
    end

    def self.remind(sayable)
      say(sayable)
    end

    private_class_method :new
  end

  class Planning
    def initialize
      @events = Appscript::app("iCal").calendars["Planning"].events.get
    end

    def target
      currentappt = @events.find_all{|mtg|
        mtg.start_date.get < Time.now() &&
        mtg.end_date.get > Time.now()
        }.first.summary.get
        if ( !currentappt || @current == :missing_value )
          return nil
        else
          return currentappt
        end
      end

      def actual
        begin 
          f = File.open("/tmp/routinetracker.log", "r")
          line = f.gets
        rescue
          # if this file doesn't exist, we just create it
          f = File.new("/tmp/routinetracker.log", "w+")
          f.write("IDLE *")
          retry
        ensure
          f.close
        end

        return line
      end

      def idle?(input)
        input.match("IDLE").to_s
      end

    end

    class Main

      if testwaarde == "IDLE" then

        #    system("/usr/local/bin/growlnotify -p 4 -m 'IDLE' ")    
        system("/usr/local/bin/growlnotify -p 5 -t 'Superfocus' -m '#{line}' ")    
        unless File.exist?("/Users/rs/Desktop/silent") then
          system("say '#{sayable}'")
        end
        #    load '/Users/rs/Dropbox/Library/Scripts/Routinetracker/plannedpomodoro.rb'
      else
        # DONE 201111031354 temporary implementation before changing routinetracker
        # sayable2 = line.split(/\#/)[0]
        # sayable = sayable2.split("<")[0] + " by " + sayable2.split("--")[1]
        # DONE 201111031354 replace this over time with 
        sayable = line.split(" ")[0]
        # tijd = line.split(" by ")[1]
        # unless !tijd
        #   sayable = "#{sayable} by #{tijd}"
        # end
        system("/usr/local/bin/growlnotify -p 0 -t 'Superfocus' -m '#{line}' ")    
        unless File.exist?("/Users/rs/Desktop/silent") then
          system("say '#{sayable}'")
        end
      end

    end
  end
end