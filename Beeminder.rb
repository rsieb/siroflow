#!/usr/bin/env ruby -wKU
# making changes to gem: subl /Users/rs/.rvm/gems/ruby-1.9.3-p194/gems/beeminder-0.2.5/lib/goals.rb
require 'rubygems'
require 'bundler/setup'
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

    def minded
      self.goals.count
    end

    # single method for archive-n-backburn
    # using slug because will be used manually
    # TODO 2013-07-08 repair. Does not work yet, undefined method?
    def archivenbb(slock)
      puts slock
      mygoal = self.allgoals.find{|doeletje|
        doeletje.slug == slock
      }
      puts "#{mygoal.title} #{mygoal.burner}"
      mygoal.burner = "backburner"
      puts "#{mygoal.title} #{mygoal.burner}"
    end

    def self.instance
      return @@instance
    end

    def goals
      # TODO 2013-07-12 add "won" method in gem
      # .select{|g| g.won == false}
      @@bee.goals(:frontburner)
    end

    def allgoals
      @@bee.goals()
    end

    def backgoals
      @@bee.goals(:backburner)
    end

    def sendoff(goalie,valuu,komment)
      @@bee.send(goalie, valuu, komment)
    end

    def update
      # TODO 2013-07-08 test if this logic works, I think it does need the self?
      mygoals = self.goals.sort_by{|doel1| self.color(doel1)}
      forclipboard=""
      mygoals.each do |doel|
        # TODO 2013-05-19 filter out automatic goals, those with å at the beginning
        if doel.title.chars.first != "@" then
          self.browser(doel)
          forclipboard = forclipboard + "\n" + doel.slug
        end
      end
      self.sendoff("minded",self.minded.to_s, "Automatically added from beeminder-update.sh and Beeminder.rb")
      IO.popen('pbcopy', 'w') { |f| f << forclipboard }
      system("/usr/bin/say 'slugs copied to clipboard' ")
    end

    # 2013-04-25 DONE create method to get color for any certain goal
    # 2013-04-25 TODO move this into its own class and find out how to call it properly
    # 2013-04-25 TODO this logic does not quite work, there is never a zero
    # 2013-04-25 TODO normalize the status calculation into its own goal method, take it out of endangered() too
    def color(doel)
      status = doel.lane / doel.yaw
      #case (doel.lane.to_f / doel.yaw.to_f).round
      case status
      when 2
        return "GREEN"
      when 1
        return "BLUE"
      when -1
        return "ORANGE"
      when -2
        return "RED"
      else
        return "UNKNOWN"
      end
    end

    def endangered(dangerlevel) # dangerlevel can be -1 for red, 0 for orange-red, 1 for blue-orange-red
      # 2013-04-23 DONE test this in reality, only seems to find some kinds of goals?
      # 2013-04-25 DONE can clean this up in constructing an array only of yaw=false arguments
      mygoals = self.goals # TODO 2013-07-12 replace this with goals won
      #mygoals = self.allgoals # 2013-07-07 changed to allgoals so that I can also get endangered archived goals
      dangergoals = Array.new()
      mygoals.each do |doel|
        # yaw: @return (number): [what is the] Good side of the road. I.e., the side of the road (+1/-1 = above/below) that makes you say “yay”.
        # lane: @return [integer]: Where you are with respect to the yellow brick road (2 or more = above the road, 1 = top lane, -1 = bottom lane, -2 or less = below the road).
        # so if lane / yaw is negative then you are on the endangered side of the road
        # so if lane / yaw is less than 1 then you are on the endangered side of the road or on the road (less than green)
        if (doel.lane.to_f/doel.yaw.to_f) <= dangerlevel then
          dangergoals.push(doel)
        end
      end
      return dangergoals
    end

    def browser(doel)
      scripttekst = 'tell application "Beeminder" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '"'
      system "/usr/bin/osascript" + " -e '" + scripttekst + "'"
      @@log.debug(Time.now.strftime("%F %T") + "#{scripttekst.dump}")
      return true
    end
  end
end
