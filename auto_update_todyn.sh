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

if [[ ! -f $TMPFILE || `find $TMPFILE -mmin +5` ]];
	then
	if [[ `ping -o www.google.com` ]];
		then
		touch $TMPFILE # update time stamp so that the script cannot run twice in parallel
		# update written and diary goals from computer
		MYFILE="$HOMEDIR/Beeminder.txt"
		echo -e "\n# From Beeminder... #" > "$MYFILE"
		. /Users/rs/rt/beeminder-pull-endangered.sh | sort -r | head -4 >> "$MYFILE" 
		#say "Beeminder updated"

		# from Pivotal tracker
		MYFILE="$HOMEDIR/Pivotal.txt"
		echo -e "# From Pivotal... #" > "$MYFILE"
		ruby -KT /Users/rs/rt/pull_active_from_pivotal.rb | head -4 >> "$MYFILE" 
		#say "Pivotal updated"

		# and add meetings from icalendarbuddy and mark as today
		MYFILE="$HOMEDIR/Calendar.txt"
		echo -e "\n# From Calendar... #" > "$MYFILE"
		. /Users/rs/rt/pullmeetingstotodoy.sh >> "$MYFILE" 
		#say "Calendar updated"

		# and add subjects from Mailbox/todo
		MYFILE="$HOMEDIR/Mailboxtodo.txt"
		echo -e "\n# From Mailbox/ToDo... #" > "$MYFILE"
		ruby -KT /Users/rs/rt/gmailtodo.rb >> "$MYFILE" 
		#say "Mailbox-to-do updated"

		# Pull together Todyn (dynamic todo)
		cd $HOMEDIR
		cat Todoy.txt Calendar.txt Pivotal.txt Beeminder.txt Mailboxtodo.txt > $TMPFILE
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

