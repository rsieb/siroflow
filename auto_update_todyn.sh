#!/bin/bash
source '/Users/rs/.bash_include_rs'

HOMEDIR="/Users/rs/Dropbox/Elements"
TODYNFILE="$HOMEDIR/Todyn.txt"
TMPFILE="/tmp/Todyn.txt"
TODONTFILE="$HOMEDIR/Todont.txt"
TODOYFILE="$HOMEDIR/Todoy.txt"
DAYBREAK="$HOMEDIR/Todobreak.txt"
touch -t `date '+%m%d0001'` $DAYBREAK

if [[ ! -f $TMPFILE || `find $TMPFILE -mmin +1` ]];
then
	touch $TMPFILE # update time stamp so that the script cannot run twice in parallel
	if [[ `ping -o www.google.com` ]];
	then

		# Do we need to update the daily goals first? Is Todoy older than 00:01 today?
		if [[ ! -f $TODOYFILE || `find $DAYBREAK -newer $TODOYFILE` ]] ; then
			# using date +%k (without preceding 0) otherwise Bash thinks this is octal 2013-12-01
			if [[ $(date +%k) -gt 3 ]] ; then
				#say "I would update Beeminder now"
				. /Users/rs/rt/add_daily_to_todoy.sh
			fi
		fi

		MYFILE1="$HOMEDIR/Beeminder-redplusorange.txt"
		MYFILE2="$HOMEDIR/Beeminder-blue.txt"
		#echo -e "\n# From Beeminder... #" > "$MYFILE"
			. /Users/rs/rt/beeminder-pull-endangered.sh > /tmp/beeminderoutput.txt 2>&1
		echo -e "\n" > "$MYFILE1"
			cat /tmp/beeminderoutput.txt | sort -r | grep "UNKNOWN" | head -3 >> "$MYFILE1"
			cat /tmp/beeminderoutput.txt | sort -r | grep "RED" | head -3 >> "$MYFILE1"
			cat /tmp/beeminderoutput.txt | sort -r | grep "ORANGE" | head -3 >> "$MYFILE1"
		echo -e "\n" > "$MYFILE2"
			cat /tmp/beeminderoutput.txt | sort -r | grep "BLUE" | head -3 >> "$MYFILE2"
		#say "Beeminder updated"

		# from Pivotal tracker
		MYFILE="$HOMEDIR/Pivotal.txt"
		#echo -e "# From Pivotal... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		# if [[ $(date +%u) -ne 6 ]] # no proactive work on Saturdays
		# then
			ruby -KT /Users/rs/rt/pivotal_pull_active.rb | head -5 >> "$MYFILE"
		# fi
		echo -e "\n" >> "$MYFILE"
		#say "Pivotal updated"

		# and add meetings from icalendarbuddy and mark as today
		MYFILE="$HOMEDIR/Calendar.txt"
		#echo -e "\n# From Calendar... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		. /Users/rs/rt/pullmeetingstotodoy.sh >> "$MYFILE" 2>&1
		#say "Calendar updated"

		# and add subjects from Mailbox/todo
		MYFILE="$HOMEDIR/Mailboxtodo.txt"
		#echo -e "\n# From Mailbox/ToDo... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		ruby -KT /Users/rs/rt/gmailtodo.rb | head -3 >> "$MYFILE" 2>&1
		#say "Mailbox-to-do updated"

		# Pull together Todyn (dynamic todo)
		cd $HOMEDIR
		cat Calendar.txt Beeminder-redplusorange.txt Pivotal.txt Todoy.txt Mailboxtodo.txt Beeminder-blue.txt > $TMPFILE 2>&1
		# Mark as today
		echo "" >> $TMPFILE
		#echo $PATH >> $TMPFILE
		echo -e "\n`date '+%Y-%m-%d %H:%M'`" >> $TMPFILE
	fi
	# Take out ignored lines
	# subtracting two files from each other as per <http://aijazansari.com/2011/11/23/how-to-subtract-one-file-from-another/>
	# NB file with negative lines should come first :)
	if [[ -s $TODONTFILE ]] ; then
		# first ensure there are no white lines in Todont
		grep -v '^$' $TODONTFILE > /tmp/Todont.txt 2>&1
		cp /tmp/Todont.txt $TODONTFILE
		# now take all the ignorable lines out of the temporary Todyn by matching against Todont
		grep --invert-match --line-regexp --file=$TODONTFILE $TMPFILE | cat -s > $TODYNFILE  2>&1
	else
		cat -s $TMPFILE > $TODYNFILE
	fi
else
	echo "Todyn updated less than one minute ago... Aborting."
fi
#osascript -e 'tell application "nvALT" to search "Todyn" ' -e 'tell application "nvALT" to activate'

