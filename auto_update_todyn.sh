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

HOMEDIR="/Users/rs/Dropbox/Elements"
TODYNFILE="$HOMEDIR/Todyn.txt"
TMPFILE="/tmp/Todyn.txt"
TODONTFILE="$HOMEDIR/Todont.txt"
TODOYFILE="$HOMEDIR/Todoy.txt"
DAYBREAK="$HOMEDIR/Todobreak.txt"
touch -t `date '+%m%d0001'` $DAYBREAK

if [[ ! -f $TMPFILE || `find $TMPFILE -mmin +5` ]];
	then
		touch $TMPFILE # update time stamp so that the script cannot run twice in parallel
		if [[ `ping -o www.google.com` ]];
			then
		
		# Do we need to update the daily goals first? Is Todoy older than 00:01 today?
		if [[ ! -f $TODOYFILE || `find $DAYBREAK -newer $TODOYFILE` ]];
		then
			. /Users/rs/rt/add_daily_to_todoy.sh
		fi

		# update written and diary goals from computer
		MYFILE="$HOMEDIR/Beeminder.txt"
		#echo -e "\n# From Beeminder... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		# if [[ $(date +%u) -ne 6 ]] # only 3 on non Saturdays
		# then
			. /Users/rs/rt/beeminder-pull-endangered.sh | sort -r | head -3 >> "$MYFILE" 
		# else
		# 	. /Users/rs/rt/beeminder-pull-endangered.sh | sort -r | head -6 >> "$MYFILE" 
		# fi
		#say "Beeminder updated"

		# from Pivotal tracker
		MYFILE="$HOMEDIR/Pivotal.txt"
		#echo -e "# From Pivotal... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		# if [[ $(date +%u) -ne 6 ]] # no proactive work on Saturdays
		# then
			ruby -KT /Users/rs/rt/pull_active_from_pivotal.rb | head -3 >> "$MYFILE" 
		# fi
		#say "Pivotal updated"

		# and add meetings from icalendarbuddy and mark as today
		MYFILE="$HOMEDIR/Calendar.txt"
		#echo -e "\n# From Calendar... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		. /Users/rs/rt/pullmeetingstotodoy.sh >> "$MYFILE" 
		#say "Calendar updated"

		# and add subjects from Mailbox/todo
		MYFILE="$HOMEDIR/Mailboxtodo.txt"
		#echo -e "\n# From Mailbox/ToDo... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		ruby -KT /Users/rs/rt/gmailtodo.rb >> "$MYFILE" 
		#say "Mailbox-to-do updated"

		# Pull together Todyn (dynamic todo)
		cd $HOMEDIR
		cat Calendar.txt Beeminder.txt Pivotal.txt Mailboxtodo.txt Todoy.txt > $TMPFILE
		# Mark as today
		echo "" >> $TMPFILE
		echo -e "\n`date '+%Y-%m-%d %H:%M'`" >> $TMPFILE 

	fi
		# Take out ignored lines
		# subtracting two files from each other as per <http://aijazansari.com/2011/11/23/how-to-subtract-one-file-from-another/>
		# NB file with negative lines should come first :)
		if [[ -s $TODONTFILE ]] ; then
			# first ensure there are no white lines in Todont
			grep -v '^$' $TODONTFILE > /tmp/Todont.txt
			cp /tmp/Todont.txt $TODONTFILE
			# now take all the ignorable lines out of the temporary Todyn by matching against Todont
			grep --invert-match --line-regexp --file=$TODONTFILE $TMPFILE | cat -s > $TODYNFILE 
		else
			cat -s $TMPFILE > $TODYNFILE
		fi
else
	echo "Todyn updated less than five minutes ago... Aborting."
fi
#osascript -e 'tell application "nvALT" to search "Todyn" ' -e 'tell application "nvALT" to activate'

