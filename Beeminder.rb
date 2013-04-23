#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'beeminder'
require 'pp'
require 'yaml'

LAADBESTAND="/tmp/beemindergoals.yaml"
SECRETCODE="UUTnFgjX2FyEyC3GX2zW"

module RoutineTracker
  class Minder

    def initialize(secret)
      @@bee = Beeminder::User.new(secret)
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
        scripttekst = 'tell application "Safari" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '"'
        #scripttekst = "beep"
        #puts scripttekst
        system ("/usr/bin/osascript" + " -e '" + scripttekst + "'")
      end
    end

    def endangered
      mygoals = self.goals(false)
      mygoals.each do |doel|
        if doel.yaw >0 then
          mygoals.delete(doel)
        end
      end
      return mygoals
    end

  end
end


# TESTCODE
b = RoutineTracker::Minder.new(SECRETCODE)
b.endangered.each do |doel|
  puts doel.slug
end

# mygoals.each do |doel|
#   scripttekst = 'tell application "Safari" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '"'
#   #scripttekst = "beep"
#   #puts scripttekst
#   system ("/usr/bin/osascript" + " -e '" + scripttekst + "'")
# end
# system("/usr/bin/osascript -e 'tell application \"Safari\" to activate' ")
