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

while getopts ":d:a" opt; do
  case $opt in
    d)
		/usr/bin/env ruby /Users/rs/rt/pivotal_accepted.rb 2>&1
		echo "-d was triggered!" >&2
		;;
    a)
		/usr/bin/env ruby /Users/rs/rt/pivotal_pull_active.rb 2>&1
		;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

