#!/bin/bash


/usr/bin/env ruby <<-EORUBY

require '/Users/rs/rt/Beeminder.rb'
b = RoutineTracker::Minder.new(SECRETCODE)

b.allgoals.each do |doel|
  #scripttekst = 'tell application "Beeminder" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '/edit"'
  #system "/usr/bin/osascript" + " -e '" + scripttekst + "'"
  puts doel.slug
end


EORUBY