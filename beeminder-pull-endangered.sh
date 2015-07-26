#!/bin/bash
source '/Users/rs/.bash_include_rs'

/usr/bin/env ruby <<-EORUBY

require '/Users/rs/rt/Beeminder.rb'
b = RoutineTracker::Minder.new(SECRETCODE)
dangerlevel = 1 #-1 for red, 0 for orange-red, 1 for blue-orange-red -- to be tested
b.endangered(dangerlevel).each do |doel|
  puts "#{b.color(doel)} USD#{sprintf('%03d',doel.pledge.to_i)} #{doel.title} https://www.beeminder.com/cyberroland/goals/#{doel.slug} +beem #{doel.limsum}"
### b.browser(doel)
end


EORUBY