#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'beeminder'
require 'pp'
require 'yaml'

LAADBESTAND="/tmp/beemindergoals.yaml"
RESPECTCACHE=true

## LOAD GOALS ## 
if ( File.exist?(LAADBESTAND) && RESPECTCACHE==true)
  mygoals = YAML.load_file(LAADBESTAND)
else
  bee = Beeminder::User.new "UUTnFgjX2FyEyC3GX2zW"
  mygoals = bee.goals(:frontburner)
  File.open(LAADBESTAND,'w') do |uit|
    YAML.dump(mygoals,uit)
  end
end

mygoals.each do |doel|
  scripttekst = 'tell application "Safari" to open location "http://www.beeminder.com/cyberroland/goals/' + doel.slug + '"'
  #scripttekst = "beep"
  #puts scripttekst
  system ("/usr/bin/osascript" + " -e '" + scripttekst + "'")
end
system("/usr/bin/osascript -e 'tell application \"Safari\" to activate' ")
