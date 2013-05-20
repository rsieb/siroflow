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

/Users/rs/.rvm/gems/ruby-1.9.3-p194/bin/beemind -t UUTnFgjX2FyEyC3GX2zW lifthabits `/usr/bin/env ruby /Users/rs/rt/Lift.rb` "Auto-added from Launchdaemon `date`"
