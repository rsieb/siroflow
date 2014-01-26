#!/bin/bash
source '/Users/rs/.bash_include_rs'
export PATH="./bin:/Users/rs/bin:/Users/rs/.rbenv/bin:/Users/rs/.rbenv/shims:/Users/rs/perl5/perlbrew/bin:/Users/rs/perl5/perlbrew/perls/perl-5.16.0/bin::/Users/rs/bin:/usr/local/bin:/usr/local/sbin:/Users/rs/Dropbox/Library/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/sbin"

HOMEDIR="/Users/rs/Dropbox/Elements"
TODYNFILE="$HOMEDIR/Todyn.txt"
TMPFILE="/tmp/Todyn.txt"
TODONTFILE="$HOMEDIR/Todont.txt"
TODOYFILE="$HOMEDIR/Todoy.txt"
DAYBREAK="$HOMEDIR/Todobreak.txt"
touch -t `date '+%m%d0001'` $DAYBREAK

# logger levels: 0emergency 1alert 2critical 3error 4warning 5notice 6info 7debug

# __        __    _ _                       _             _
# \ \      / /_ _(_) |_    __ _   _ __ ___ (_)_ __  _   _| |_ ___
#  \ \ /\ / / _` | | __|  / _` | | '_ ` _ \| | '_ \| | | | __/ _ \
#   \ V  V / (_| | | |_  | (_| | | | | | | | | | | | |_| | ||  __/
#    \_/\_/ \__,_|_|\__|  \__,_| |_| |_| |_|_|_| |_|\__,_|\__\___|
#
if [[ ! -f $TMPFILE || `find $TMPFILE -mmin +1` ]];
	then
	logger -s -p6 "Starting update..."
	touch $TMPFILE # update time stamp so that the script cannot run twice in parallel
	#   ___        _ _                          _
	#  / _ \ _ __ | (_)_ __   ___    ___  _ __ | |_   _
	# | | | | '_ \| | | '_ \ / _ \  / _ \| '_ \| | | | |
	# | |_| | | | | | | | | |  __/ | (_) | | | | | |_| |
	#  \___/|_| |_|_|_|_| |_|\___|  \___/|_| |_|_|\__, |
	#                                             |___/
	if [[ ! `ping -o www.google.com` ]];
		then
		logger -s -p2 "We are not online. Aborting."
		exit
	else
		#  ____                     ____        _ _      ___
		# |  _ \  ___  _ __   ___  |  _ \  __ _(_) |_   |__ \
		# | | | |/ _ \| '_ \ / _ \ | | | |/ _` | | | | | |/ /
		# | |_| | (_) | | | |  __/ | |_| | (_| | | | |_| |_|
		# |____/ \___/|_| |_|\___| |____/ \__,_|_|_|\__, (_)
		#                                           |___/
		# Do we need to update the daily goals first? Is Todoy older than 00:01 today?
		# if [[ ! -f $TODOYFILE ]] ; then
		# 	logger -s -p7 "${TODOYFILE} is missing so I need to do my daily stuff"
		# else
		# 	logger -s -p7 "${TODOYFILE} is in existence already."
		# fi
		# if test `find $DAYBREAK -newer $TODOYFILE` ; then
		# 	logger -s -p7 "${TODOYFILE} IS OLDER THAN ${DAYBREAK} so I need to do my daily stuff"
		# else
		# 	logger -s -p7 "${TODOYFILE} IS NEWER THAN ${DAYBREAK} so I don't need to do my daily stuff"
		# fi
		# exit
		if [[ ! -f $TODOYFILE || `find $DAYBREAK -newer $TODOYFILE` ]]
			then
			logger -s -p5 "Performing 'add_daily_to_todoy.sh' "
			#say "I would update Beeminder now"
			source /Users/rs/rt/add_daily_to_todoy.sh || logger -s -p3 "Error: 'add_daily_to_todoy.sh' "
		else
			logger -s -p5 "Skipped 'add_daily_to_todoy.sh'"
		fi

		#  ____                      _           _
		# | __ )  ___  ___ _ __ ___ (_)_ __   __| | ___ _ __
		# |  _ \ / _ \/ _ \ '_ ` _ \| | '_ \ / _` |/ _ \ '__|
		# | |_) |  __/  __/ | | | | | | | | | (_| |  __/ |
		# |____/ \___|\___|_| |_| |_|_|_| |_|\__,_|\___|_|
		#
		MYFILE1="$HOMEDIR/Beeminder-redplusorange.txt"
		MYFILE2="$HOMEDIR/Beeminder-blue.txt"
		#echo -e "\n# From Beeminder... #" > "$MYFILE"
		source /Users/rs/rt/beeminder-pull-endangered.sh > /tmp/beeminderoutput.txt || logger -s -p3 "Error: 'beeminder-pull-endangered.sh'"
		echo -e "\n" > "$MYFILE1"
		cat /tmp/beeminderoutput.txt | sort -r | grep "UNKNOWN" | head -3 >> "$MYFILE1"
		cat /tmp/beeminderoutput.txt | sort -r | grep "RED" | head -3 >> "$MYFILE1"
		cat /tmp/beeminderoutput.txt | sort -r | grep "ORANGE" | head -3 >> "$MYFILE1"
		echo -e "\n" > "$MYFILE2"
		cat /tmp/beeminderoutput.txt | sort -r | grep "BLUE" | head -3 >> "$MYFILE2"
		#say "Beeminder updated"

		#  ____  _            _        _
		# |  _ \(_)_   _____ | |_ __ _| |
		# | |_) | \ \ / / _ \| __/ _` | |
		# |  __/| |\ V / (_) | || (_| | |
		# |_|   |_| \_/ \___/ \__\__,_|_|
		#
		# from Pivotal tracker
		MYFILE="$HOMEDIR/Pivotal.txt"
		#echo -e "# From Pivotal... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		# if [[ $(date +%u) -ne 6 ]] # no proactive work on Saturdays
		# then
		ruby -KT /Users/rs/rt/pivotal_pull_active.rb | head -5 >> "$MYFILE" || logger -s -p3 "Error: ${MYFILE}"
		# fi
		echo -e "\n" >> "$MYFILE"
		#say "Pivotal updated"

		#   ____      _                _
		#  / ___|__ _| | ___ _ __   __| | __ _ _ __
		# | |   / _` | |/ _ \ '_ \ / _` |/ _` | '__|
		# | |__| (_| | |  __/ | | | (_| | (_| | |
		#  \____\__,_|_|\___|_| |_|\__,_|\__,_|_|
		#
		# and add meetings from icalendarbuddy and mark as today
		MYFILE="$HOMEDIR/Calendar.txt"
		#echo -e "\n# From Calendar... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		source /Users/rs/rt/pullmeetingstotodoy.sh >> "$MYFILE" || logger -s -p3 "Error: ${MYFILE}"
		#say "Calendar updated"

		#   ____                 _ _ _____         _
		#  / ___|_ __ ___   __ _(_) |_   _|__   __| | ___
		# | |  _| '_ ` _ \ / _` | | | | |/ _ \ / _` |/ _ \
		# | |_| | | | | | | (_| | | | | | (_) | (_| | (_) |
		#  \____|_| |_| |_|\__,_|_|_| |_|\___/ \__,_|\___/
		#
		# and add subjects from Mailbox/todo
		MYFILE="$HOMEDIR/Mailboxtodo.txt"
		#echo -e "\n# From Mailbox/ToDo... #" > "$MYFILE"
		echo -e "\n" > "$MYFILE"
		ruby -KT /Users/rs/rt/gmailtodo.rb | head -3 >> "$MYFILE" || logger -s -p3 "Error: ${MYFILE}"
		#say "Mailbox-to-do updated"

		#   ____                      _ _     _       _
		#  / ___|___  _ __  ___  ___ | (_) __| | __ _| |_ ___
		# | |   / _ \| '_ \/ __|/ _ \| | |/ _` |/ _` | __/ _ \
		# | |__| (_) | | | \__ \ (_) | | | (_| | (_| | ||  __/
		#  \____\___/|_| |_|___/\___/|_|_|\__,_|\__,_|\__\___|
		#
		# Pull together Todyn (dynamic todo)
		cd $HOMEDIR
		cat Calendar.txt Beeminder-redplusorange.txt Pivotal.txt Todoy.txt Mailboxtodo.txt Beeminder-blue.txt > $TMPFILE || logger -s -p3 "Error: Consolidation"
		# Mark as today
		echo "" >> $TMPFILE
		export PARENTPROCESS=`ps -ocommand= -p $PPID | awk -F/ '{print $NF}' | awk '{print $1}'`
		#echo $PATH >> $TMPFILE
		echo -e "\n`date '+%Y-%m-%d %H:%M'` ${PARENTPROCESS}" >> $TMPFILE  || logger -s -p3 "Error: ${PARENTPROCESS}"
	fi

	#   ____ _                                  _____         _             _
	#  / ___| | ___  __ _ _ __    _   _ _ __   |_   _|__   __| | ___  _ __ | |_
	# | |   | |/ _ \/ _` | '_ \  | | | | '_ \    | |/ _ \ / _` |/ _ \| '_ \| __|
	# | |___| |  __/ (_| | | | | | |_| | |_) |   | | (_) | (_| | (_) | | | | |_
	#  \____|_|\___|\__,_|_| |_|  \__,_| .__/    |_|\___/ \__,_|\___/|_| |_|\__|
	#                                  |_|
	#
	# Take out ignored lines
	# subtracting two files from each other as per <http://aijazansari.com/2011/11/23/how-to-subtract-one-file-from-another/>
	# NB file with negative lines should come first :)
	if [[ -s $TODONTFILE ]] ; then
		# first ensure there are no white lines in Todont
		grep -v '^$' $TODONTFILE > /tmp/Todont.txt || logger -s -p3 "Error: ${TODONTFILE} white lines removal"
		cp /tmp/Todont.txt $TODONTFILE
		# now take all the ignorable lines out of the temporary Todyn by matching against Todont
		grep --invert-match --line-regexp --file=$TODONTFILE $TMPFILE | cat -s > $TODYNFILE   || logger -s -p3 "Error: ${TODONTFILE} deduplication"
	else
		cat -s $TMPFILE > $TODYNFILE
	fi
else
	logger -s -p5 "Todyn updated less than one minute ago... Aborting."
fi

