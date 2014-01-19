#!/bin/bash
source '/Users/rs/.bash_include_rs'

# set base directory from which to work
HOMEDIR="/Users/rs/Dropbox/Elements"
#  cd $HOMEDIR # i think this is causing errors

# start updating Beeminder
#require './jiradaily.rb'
say "Updating Beeminder..."
bash /Users/rs/rt/beeminder-update.sh

# reset finished stories from yesterday in Pivotal
# [this allows for temporary ignoring stories, i.e. "finished" needs to be delivered to be really finished]
# TODO 2013-08-11 can integrate those two scripts
ruby /Users/rs/rt/pivotal_finished_reset.rb
# ruby /Users/rs/rt/pivotal_accepted.rb # updating Beeminder is built into this script

# update written and diary goals from computer
# say "Updating Automated goals..."
# beemind -t UUTnFgjX2FyEyC3GX2zW written `find /Users/rs/Dropbox/Writing -type f -print0 | xargs -0 cat | wc -w` "Auto-added from add_daily_to_todoy.sh `date`"
beemind -t UUTnFgjX2FyEyC3GX2zW dagboek `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -print | wc -l` "Auto-added from add_daily_to_todoy.sh `date`"
# beemind -t UUTnFgjX2FyEyC3GX2zW it `cat /Users/rs/rt/interruptions.log | wc -l` "Auto-added from add_daily_to_todoy.sh `date`"

# remove the old todont file
say "Removing old TODONT file..."
cat $HOMEDIR/Todont.txt $HOMEDIR/Todonterday.txt > /tmp/todonterday.txt
rm $HOMEDIR/Todonterday.txt
cp /dev/null $HOMEDIR/Todont.txt
mv /tmp/todonterday.txt $HOMEDIR/Todonterday.txt

# clear the old todonetoday file
cp /dev/null $HOMEDIR/Todonetoday.txt
echo "" > $HOMEDIR/Todonetoday.txt
echo -e "\n# Done Today... #" >> $HOMEDIR/Todonetoday.txt

# archive the old today file to the front of the yesterday file
say "Archiving old TODAY file..."
cat $HOMEDIR/Todoy.txt $HOMEDIR/Todosterday.txt > /tmp/todosterday.txt
rm $HOMEDIR/Todosterday.txt
mv /tmp/todosterday.txt $HOMEDIR/Todosterday.txt


# add daily to front of todoy
#echo "Todoy>>start" > /tmp/todoy.txt
cat $HOMEDIR/tododaily.txt > /tmp/todoy.txt
if [[ $(date +%u) -gt 5 || $(date +%u) -eq 0 ]] ; then
	./add_weekly_to_todoy.sh
fi

# add tomorrow to todoy -- moved somedaymaybe to weekly only
echo "" >> /tmp/todoy.txt
#echo -e "\n# Added Yesterday... (for Workflowy?) #" >> /tmp/todoy.txt
cat $HOMEDIR/Todorrow.txt >> /tmp/todoy.txt
cp /dev/null $HOMEDIR/Todorrow.txt

# Mark as today
#echo "" >> /tmp/todoy.txt
#echo -e "\n`date '+%Y-%m-%d'`" >> /tmp/todoy.txt 2>&1

# now copy the new file into place
say "Creating new TODOY file..."
rm $HOMEDIR/Todoy.txt
#echo "Todoy>>end" >> /tmp/todoy.txt
mv /tmp/todoy.txt $HOMEDIR/Todoy.txt
#touch /tmp/${TODAYDATE}.log"
say "Todoy updated"

# 2013-06-24 This file is now called from auto_update_todyn.sh so this call would be circular
#rm /tmp/Todyn.txt # necessary or it calls the 5 minute exception
#. /Users/rs/rt/auto_update_todyn.sh
#say "Todyn updated"

# And create a default TODONT file
say "Creating new TODONT file..."
cat $HOMEDIR/Todonetoday.txt > $HOMEDIR/Todont.txt
#open Todont.txt


