#!/bin/bash

# set up RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"
fi

/usr/bin/env ruby <<-EORUBY

require '/Users/rs/rt/Beeminder.rb'
b = RoutineTracker::Minder.new(SECRETCODE)
dangerlevel = 1 #-1 for red, 0 for orange-red, 1 for blue-orange-red -- to be tested
b.endangered(dangerlevel).each do |doel|
  puts "#{b.color(doel)} USD#{sprintf('%03d',doel.pledge.to_i)} #{doel.slug} +beem #{doel.limsum}"
#  b.browser(doel)
end


EORUBY