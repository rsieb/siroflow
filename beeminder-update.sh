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
# TESTCODE
b = RoutineTracker::Minder.new(SECRETCODE)
b.update


EORUBY