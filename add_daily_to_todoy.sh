#!/bin/bash
source '/Users/rs/.bash_include_rs'

# set base directory from which to work
HOMEDIR="/Users/rs/Dropbox/Elements"
TODODAILY=$HOMEDIR/tododaily.txt
TODONETODAY=$HOMEDIR/Todonetoday.txt
TODONTERDAY=$HOMEDIR/Todonterday.txt
TODONTFILE=$HOMEDIR/Todont.txt
TODORROW=$HOMEDIR/Todorrow.txt
TODOSTERDAY=$HOMEDIR/Todosterday.txt
TODOWEEKLY=$HOMEDIR/Todoweekly.txt
TODOYFILE=$HOMEDIR/Todoy.txt


# start updating Beeminder
#require './jiradaily.rb'
logger -s -p6 "Updating Beeminder..."
# update written and diary goals from computer
# logger -s -p6 "Updating Automated goals..."
# beemind -t UUTnFgjX2FyEyC3GX2zW written `find /Users/rs/Dropbox/Writing -type f -print0 | xargs -0 cat | wc -w` "Auto-added from add_daily_to_todoy.sh `date`"
# beemind -t UUTnFgjX2FyEyC3GX2zW dagboek `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -print | wc -l` "Auto-added from add_daily_to_todoy.sh `date`"
# beemind -t UUTnFgjX2FyEyC3GX2zW it `cat /Users/rs/rt/interruptions.log | wc -l` "Auto-added from add_daily_to_todoy.sh `date`"
bash /Users/rs/rt/beeminder-autoupdates.sh
#bash /Users/rs/rt/beeminder-update.sh - this is the one causing all the browser windows to open :)

# reset finished stories from yesterday in Pivotal
# [this allows for temporary ignoring stories, i.e. "finished" needs to be delivered to be really finished]
# TODO 2013-08-11 can integrate those two scripts
ruby /Users/rs/rt/pivotal_finished_reset.rb
# ruby /Users/rs/rt/pivotal_accepted.rb # updating Beeminder is built into this script

# remove the old todont file
logger -s -p6 "Removing old TODONT file..."
cat $TODONTFILE $TODONTERDAY > /tmp/todonterday.txt
rm $TODONTERDAY
cp /dev/null $TODONTFILE
mv /tmp/todonterday.txt $TODONTERDAY

# clear the old todonetoday file
cp /dev/null $TODONETODAY
echo "" > $TODONETODAY
echo -e "\n# Done Today... #" >> $TODONETODAY

# archive the old today file to the front of the yesterday file
logger -s -p6 "Archiving old TODAY file..."
cat $TODOYFILE $TODOSTERDAY > /tmp/todosterday.txt
rm $TODOSTERDAY
mv /tmp/todosterday.txt $TODOSTERDAY


## add daily to front of todoy
echo "Todoy copied `date`" > /tmp/todoy.txt
cat $TODODAILY > /tmp/todoy.txt
if [[ $(date +%u) -gt 5 || $(date +%u) -eq 0 ]] ; then
	cat $TODOWEEKLY >> "/tmp/todoy.txt"
fi

## add recurring tasks from todo.sh recur
/Users/rs/bin/runrecur.sh >> /tmp/todoy.txt 

# # add tomorrow to todoy -- moved somedaymaybe to weekly only
# echo "" >> /tmp/todoy.txt
# #echo -e '\n# Added Yesterday... (for Workflowy?) #' >> /tmp/todoy.txt
# cat $TODORROW >> /tmp/todoy.txt
# cp /dev/null $TODORROW

# Mark as today
#echo "" >> /tmp/todoy.txt
#echo -e "\n`date '+%Y-%m-%d'`" >> /tmp/todoy.txt 2>&1

# now copy the new file into place
logger -s -p6 "Creating new TODOY file..."
rm $TODOYFILE
#echo "Todoy>>end" >> /tmp/todoy.txt
mv /tmp/todoy.txt $TODOYFILE
#touch /tmp/${TODAYDATE}.log"
logger -s -p6 "Todoy updated"

# 2013-06-24 This file is now called from auto_update_todyn.sh so this call would be circular
#rm /tmp/Todyn.txt # necessary or it calls the 5 minute exception
#. /Users/rs/rt/auto_update_todyn.sh
#logger -s -p6 "Todyn updated"

# And create a default TODONT file
logger -s -p6 "Creating new TODONT file..."
cat $TODONETODAY > $TODONTFILE
#open Todont.txt

#system("/usr/bin/osascript -e 'open location  \"https://www.pivotaltracker.com/s/projects/781813/\" ' ")
# system("/Applications/Growl.app/Contents/MacOS/Growl  ")
