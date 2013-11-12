#!/bin/bash

#say "I am firing"
source /Users/rs/.rbenv_include.sh >> /Users/rs/Library/Logs/com.rolandsiebelink.chaseidle.log 2>&1
bash /Users/rs/rt/auto_update_todyn.sh  >> /Users/rs/Library/Logs/com.rolandsiebelink.chaseidle.log 2>&1
ruby /Users/rs/rt/chaseidle.rb  >> /Users/rs/Library/Logs/com.rolandsiebelink.chaseidle.log 2>&1
