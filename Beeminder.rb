#!/usr/bin/env ruby -wKU
# making changes to gem: subl /Users/rs/.rvm/gems/ruby-1.9.3-p194/gems/beeminder-0.2.5/lib/goals.rb
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
      # 2013-04-25 TODO can clean this up in constructing an array only of yaw=false arguments
      mygoals = self.goals(false)
      dangergoals = Array.new()
      mygoals.each do |doel|
        # yaw: @return (number): [what is the] Good side of the road. I.e., the side of the road (+1/-1 = above/below) that makes you say “yay”.
        # lane: @return [integer]: Where you are with respect to the yellow brick road (2 or more = above the road, 1 = top lane, -1 = bottom lane, -2 or less = below the road).
        # so if lane / yaw is negative then you are on the endangered side of the road
        # so if lane / yaw is less than 1 then you are on the endangered side of the road or on the road (less than green)
        if (doel.lane.to_f/doel.yaw.to_f) <= 1 then
          dangergoals.push(doel)
        end
      end
      return dangergoals
    end

    def safari(doel)
      scripttekst = 'tell application "Safari" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '"'
      system "/usr/bin/osascript" + " -e '" + scripttekst + "'"
      @@log.debug(Time.now.strftime("%F %T") + "#{scripttekst.dump}")
      return true
    end
  end
end
