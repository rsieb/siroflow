#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'beeminder'
require 'pp'
require 'yaml'
require 'logger'


LAADBESTAND="/tmp/beemindergoals.yaml"
SECRETCODE="UUTnFgjX2FyEyC3GX2zW"

module RoutineTracker
  class Minder

    # set up logging
    @@log = Logger.new( '/Users/rs/Library/Logs/com.rolandsiebelink.beeminder-rb', 'monthly' )
    @@log.level = Logger::DEBUG

    def initialize(secret)
      @@bee = Beeminder::User.new(secret)
      @@log.debug(Time.now.strftime("%F %T") + @@bee.inspect)
      return @@bee
    end

    def self.instance
      return @@instance
    end

    def goals(refresh)
      if (refresh && File.exist?(LAADBESTAND)) then
        mygoals = YAML.load_file(LAADBESTAND)
      else
        mygoals = @@bee.goals(:frontburner)
        File.open(LAADBESTAND,'w') do |uit|
          YAML.dump(mygoals,uit)
        end
      end
      return mygoals
    end

    def update
      mygoals = self.goals(true)
      mygoals.each do |doel|
        self.safari(doel)
      end
    end

    def endangered
      # 2013-04-23 TODO test this in reality, only seems to find some kinds of goals?
      mygoals = self.goals(false)
      mygoals.each do |doel|
        if doel.yaw >0 then
          mygoals.delete(doel)
        end
      end
      return mygoals
    end

    def safari(doel)
      scripttekst = 'tell application "Safari" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '"'
      system "/usr/bin/osascript" + " -e '" + scripttekst + "'"
      @@log.debug(Time.now.strftime("%F %T") + "#{scripttekst.dump}")
      return true
    end
  end
end


# TESTCODE
b = RoutineTracker::Minder.new(SECRETCODE)
# b.endangered.each do |doel|
#   safari(doel)
# end
b.update
