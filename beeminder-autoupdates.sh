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

beemind -t UUTnFgjX2FyEyC3GX2zW lifthabits `/usr/bin/env ruby /Users/rs/rt/Lift.rb` "Auto-added `date` from launchagents/beeminder-autoupdates.sh"
beemind -t UUTnFgjX2FyEyC3GX2zW written `find /Users/rs/Dropbox/Writing -type f -print0 | xargs -0 cat | wc -w` "Auto-added `date` from launchagents/beeminder-autoupdates.sh"
beemind -t UUTnFgjX2FyEyC3GX2zW dagboek `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -print | wc -l` "Auto-added `date` from launchagents/beeminder-autoupdates.sh"
beemind -t UUTnFgjX2FyEyC3GX2zW it `cat /Users/rs/rt/interruptions.log | wc -l` "Auto-added `date` from launchagents/beeminder-autoupdates.sh"

