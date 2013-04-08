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

#HOMEDIR="/Users/rs/Library/Application Support/Notational Data"
HOMEDIR="/Users/rs/Dropbox/Elements"
# ## move first line of todo to todone
# echo `date +'%a %Y-%m-%d %H:%M'` `head -n +1 "${HOMEDIR}/Todoy.txt"` > /tmp/todone.txt && cat "${HOMEDIR}/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "${HOMEDIR}/Todone.txt" && say "todone updated"

# check if this script has run already today
LASTLINE=`/usr/bin/tail -1 "/Users/rs/Dropbox/Elements/Todoy.txt"`
if [ "$LASTLINE" == `date '+%Y-%m-%d'` ]; then
	exit 0
fi

# archive the old today file to the front of the yesterday file
/bin/cat "${HOMEDIR}/Todoy.txt" > "/tmp/todosterday.txt"
/bin/cat "${HOMEDIR}/Todosterday.txt" >> "/tmp/todosterday.txt"
/bin/rm "${HOMEDIR}/Todosterday.txt"
/bin/mv "/tmp/todosterday.txt" "${HOMEDIR}/Todosterday.txt"

# add daily to front of todoy
/bin/cat "${HOMEDIR}/tododaily.txt" > "/tmp/todoy.txt"
### don't keep yesterday's Todoy tasks in place
#/bin/cat "${HOMEDIR}/Todoy.txt" >> "/tmp/todoy.txt"

# add tomorrow to todoy -- moved somedaymaybe to weekly only
echo "" >> "/tmp/todoy.txt"
echo -e "\n# Added Yesterday... #\n" >> "/tmp/todoy.txt"
/bin/cat "${HOMEDIR}/Todorrow.txt" >> "/tmp/todoy.txt"
cp /dev/null  "${HOMEDIR}/Todorrow.txt"


# from Pivotal tracker
echo "" >> "/tmp/todoy.txt"
echo -e "\n# From Pivotal... #\n" >> "/tmp/todoy.txt"
/usr/bin/env ruby -KT /Users/rs/rt/pull_active_from_pivotal.rb >>  "/tmp/todoy.txt" 2>&1

# also update Pivotal tasks without tasks
/usr/bin/env ruby -KT /Users/rs/rt/pivotal_stories_wo_tasks.rb

# and add meetings from icalendarbuddy and mark as today
. /Users/rs/rt/pullmeetingstotodoy.sh >>  "/tmp/todoy.txt" 2>&1
echo -e "\n`date '+%Y-%m-%d'`" >> "/tmp/todoy.txt" 2>&1

# now copy the new file into place
/bin/rm "${HOMEDIR}/Todoy.txt"
/bin/mv "/tmp/todoy.txt" "${HOMEDIR}/Todoy.txt"
#/usr/bin/touch "/tmp/${TODAYDATE}.log"
/usr/bin/say "Todoy updated"




