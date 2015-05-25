#!/bin/bash

export PATH=/Users/rs/.rbenv/shims:/Users/rs/.rbenv/bin:/Users/rs/perl5/perlbrew/bin:/Users/rs/perl5/perlbrew/perls/perl-5.16.0/bin:/Users/rs/bin:/usr/local/bin:/usr/local/sbin:/Users/rs/Dropbox/Library/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/X11R6/bin:/usr/local/git/bin:/usr/sbin
rm /tmp/Todyn.txt
cd /Users/rs/rt
source auto_update_todyn.sh 2> /Users/rs/Library/Logs/com.rolandsiebelink.auto_update_todyn.log
osascript -e 'tell application "nvALT" to search "Todyn" ' -e 'tell application "nvALT" to activate' 
say "Todyn updated"