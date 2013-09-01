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

BEEMINDSTRING="/Users/rs/.rvm/gems/ruby-1.9.3-p194/bin/beemind -t UUTnFgjX2FyEyC3GX2zW stories `ruby /Users/rs/rt/pivotal_accepted.rb`"
echo $BEEMINDSTRING
`$BEEMINDSTRING`

