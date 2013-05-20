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

# start updating Beeminder
/bin/bash /Users/rs/rt/beeminder-update.sh

# update written and diary goals from computer
/Users/rs/.rvm/gems/ruby-1.9.3-p194/bin/beemind -t UUTnFgjX2FyEyC3GX2zW written `find /Users/rs/Dropbox/Writing -type f -print0 | xargs -0 cat | wc -w` "Auto-added `date`"
/Users/rs/.rvm/gems/ruby-1.9.3-p194/bin/beemind -t UUTnFgjX2FyEyC3GX2zW dagboek `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -print | wc -l` "Auto-added `date`"

HOMEDIR="/Users/rs/Dropbox/Elements"

# remove the old todont file
/bin/cat "${HOMEDIR}/Todont.txt" > "/tmp/todonterday.txt"
/bin/cat "${HOMEDIR}/Todonterday.txt" >> "/tmp/todonterday.txt"
/bin/rm "${HOMEDIR}/Todonterday.txt"
cp /dev/null  "${HOMEDIR}/Todont.txt"
/bin/mv "/tmp/todonterday.txt" "${HOMEDIR}/Todonterday.txt"

# archive the old today file to the front of the yesterday file
/bin/cat "${HOMEDIR}/Todoy.txt" > "/tmp/todosterday.txt"
/bin/cat "${HOMEDIR}/Todosterday.txt" >> "/tmp/todosterday.txt"
/bin/rm "${HOMEDIR}/Todosterday.txt"
/bin/mv "/tmp/todosterday.txt" "${HOMEDIR}/Todosterday.txt"

# add daily to front of todoy
/bin/cat "${HOMEDIR}/tododaily.txt" > "/tmp/todoy.txt"

# add tomorrow to todoy -- moved somedaymaybe to weekly only
echo "" >> "/tmp/todoy.txt"
echo -e "\n# Added Yesterday... #" >> "/tmp/todoy.txt"
/bin/cat "${HOMEDIR}/Todorrow.txt" >> "/tmp/todoy.txt"
cp /dev/null  "${HOMEDIR}/Todorrow.txt"

# Mark as today
echo "" >> "/tmp/todoy.txt"
echo -e "\n`date '+%Y-%m-%d'`" >> "/tmp/todoy.txt" 2>&1

# now copy the new file into place
/bin/rm "${HOMEDIR}/Todoy.txt"
/bin/mv "/tmp/todoy.txt" "${HOMEDIR}/Todoy.txt"
#/usr/bin/touch "/tmp/${TODAYDATE}.log"
/usr/bin/say "Todoy updated"




