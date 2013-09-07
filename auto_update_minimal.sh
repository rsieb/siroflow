#!/bin/bash 


HOMEDIR="/Users/rs/Dropbox/Elements"
TODYNFILE="$HOMEDIR/Todyn.txt"
TMPFILE="/tmp/Todyn.txt"
TODONTFILE="$HOMEDIR/Todont.txt"
TODOYFILE="$HOMEDIR/Todoy.txt"
DAYBREAK="$HOMEDIR/Todobreak.txt"
touch -t `date '+%m%d0001'` $DAYBREAK
ls -l $DAYBREAK

if [[ ! -f $TMPFILE || `find $TMPFILE -mmin +0` ]] ; then
	echo "$TMPFILE not found or older than a minute"
	touch $TMPFILE # update time stamp so that the script cannot run twice in parallel
	echo "$TMPFILE timestamp updated"
	ls -l $TMPFILE
	if [[ `ping -o www.google.com` ]] ; then
		echo "I am online"
		# Do we need to update the daily goals first? Is Todoy older than 00:01 today?
		ls -l $TODOYFILE
		find $DAYBREAK -newer $TODOYFILE -exec ls -l {} \;
		if [[ ! -f $TODOYFILE || `find $DAYBREAK -newer $TODOYFILE` ]] ; then
			echo "Could not find $TODOYFILE or $DAYBREAK is newer than $TODOYFILE"
			if [[ $(date +%H) -gt 3 ]] ; then
				echo "It is later than 3:59am"
				echo "I would update Beeminder now"
				#. /Users/rs/rt/add_daily_to_todoy.sh
			else
				echo "It is not later than 3:59am"
			fi
		else
			echo "Could find $TODOYFILE and $DAYBREAK is not newer than $TODOYFILE"
		fi
	else
		echo "I am not online"
	fi
else
	echo "$TMPFILE was found or is not older than a minute"
fi

#osascript -e 'tell application "nvALT" to search "Todyn" ' -e 'tell application "nvALT" to activate'

