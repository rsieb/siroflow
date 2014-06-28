#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source '/Users/rs/.bash_include_rs'
export PATH="./bin:/Users/rs/bin:/Users/rs/.rbenv/bin:/Users/rs/.rbenv/shims:/Users/rs/perl5/perlbrew/bin:/Users/rs/perl5/perlbrew/perls/perl-5.16.0/bin::/Users/rs/bin:/usr/local/bin:/usr/local/sbin:/Users/rs/Dropbox/Library/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/local/git/bin:/usr/sbin"
cd /Users/rs/rt
HOMEDIR="/Users/rs/Dropbox/Elements"
TODYNFILE="$HOMEDIR/Todyn.txt"
TMPFILE="/tmp/Todyn.txt"
TODONTFILE="$HOMEDIR/Todont.txt"
TODOYFILE="$HOMEDIR/Todoy.txt"
DAYBREAK="$HOMEDIR/Todobreak.txt"

# logger levels: 0emergency 1alert 2critical 3error 4warning 5notice 6info 7debug

#    _   _ _   _   _          _          _      
#   /_\ | | | | |_| |_  ___  | |_ ___ __| |_ ___
#  / _ \| | | |  _| ' \/ -_) |  _/ -_|_-<  _(_-<
# /_/ \_\_|_|  \__|_||_\___|  \__\___/__/\__/__/

# PREZMODE
if grep -q "PREZMODE" /tmp/routinetracker.log ; then
	logger -s -p4 "Set to PREZMODE"
	PREZMODE=true
else
	logger -s -p6 "Not set to PREZMODE"
	PREZMODE=
fi

# ONLINE
if ! [ "`ping -c 1 beeminder.com`" ] ; then
	logger -s -p4 "We are not online."
	ONLINE=
else
	logger -s -p6 "We are online."
	ONLINE=true
fi

# TMPFILE EXISTS
if [ ! -f $TMPFILE ]; then
	logger -s -p4 "Could not find $TMPFILE."
	TMPFILENEEDED=true
else
	logger -s -p6 "Found $TMPFILE."
	TMPFILENEEDED=
fi

# TMPFILE NOT UPDATED IN LAST MINUTE
if [ `find $TMPFILE -mmin +1` ]; then
	logger -s -p6 "$TMPFILE updated more than one minute ago."
	WAITAMINUTE=true
else
	logger -s -p4 "$TMPFILE updated LESS than one minute ago"
	WAITAMINUTE=
fi

#  ____                     ____        _ _      ___
# |  _ \  ___  _ __   ___  |  _ \  __ _(_) |_   |__ \
	# | | | |/ _ \| '_ \ / _ \ | | | |/ _` | | | | | |/ /
# | |_| | (_) | | | |  __/ | |_| | (_| | | | |_| |_|
# |____/ \___/|_| |_|\___| |____/ \__,_|_|_|\__, (_)
#                                           |___/

# TODOYFILE EXISTS
if [ ! -f $TODOYFILE ]; then
	logger -s -p4 "Could not find TODOYFILE."
	TODOYNEEDED=true
else
	logger -s -p6 "Found TODOYFILE."
	TODOYNEEDED=
fi

# WE DID NOT SET THE DAYBREAK MARKER
if [ ! -f $DAYBREAK ]; then
	logger -s -p4 "DAYBREAK not set."
	DAYBREAKNEEDED=true
else
	logger -s -p6 "DAYBREAK set."
	DAYBREAKNEEDED=
fi

# THE DAYBREAK MARKER IS NEWER THAN TODOY
if [ `find $DAYBREAK -newer $TODOYFILE` ]; then
	logger -s -p4 "TODOYFILE created before DAYBREAK."
	NEEDFRESHTODOY=true
else
	logger -s -p6 "TODOYFILE created after DAYBREAK."
	NEEDFRESHTODOY=
fi


if grep -q "PREZMODE" /tmp/routinetracker.log ; then
	exit "PREZMODE"
fi

if [[ $ONLINE && ( $TMPFILENEEDED || $WAITAMINUTE ) ]]
	then
	logger -s -p6 "Starting update..."
	touch $TMPFILE # update time stamp so that the script cannot run twice in parallel
	if [[ $TODOYNEEDED || $DAYBREAKNEEDED || $NEEDFRESHTODOY ]]
		then
		logger -s -p5 "Performing 'add_daily_to_todoy.sh' "
		#say "I would update Beeminder now"
		#source $DIR/add_daily_to_todoy.sh || logger -s -p3 "Error: 'add_daily_to_todoy.sh' " 
		touch -t `date '+%m%d0330'` $DAYBREAK
	else
		logger -s -p5 "Skipped 'add_daily_to_todoy.sh'"
	fi # end done daily

	#  ____                      _           _
	# | __ )  ___  ___ _ __ ___ (_)_ __   __| | ___ _ __
	# |  _ \ / _ \/ _ \ '_ ` _ \| | '_ \ / _` |/ _ \ '__|
	# | |_) |  __/  __/ | | | | | | | | | (_| |  __/ |
	# |____/ \___|\___|_| |_| |_|_|_| |_|\__,_|\___|_|
	#
	MYFILE="$HOMEDIR/Beeminder-all.txt"
	#echo -e "\n# From Beeminder... #" > "$MYFILE"
	echo -e "\n" > "$MYFILE"
	source $DIR/beeminder-pull-endangered.sh | sort -r | head -4 >> "$MYFILE"  2>&1 || logger -s -p3 "Error: 'beeminder-pull-endangered.sh'"

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
	## leave next line commented out or it leaves me never to look at pivotal again
	# ruby -KT $DIR/pivotal_finished_reset.rb || logger -s -p3 "Error: pivotal_finished_reset.rb"

	ruby -KT $DIR/pivotal_pull_active.rb | head -3 >> "$MYFILE"  2>&1 || logger -s -p3 "Error: ${MYFILE}"
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
	source $DIR/calendar_events_today.sh >> "$MYFILE" 2>&1 || logger -s -p3 "Error: ${MYFILE}"
	cat $MYFILE 
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
	#ruby -KT /Users/rs/rt/gmailtodo.rb | head -3 >> "$MYFILE" || logger -s -p3 "Error: ${MYFILE}"
	ruby -KT $DIR/gmailtodo.rb || logger -s -p3 "Error: Mailboxtodo-import"
	#say "Mailbox-to-do updated"

	#   ____                      _ _     _       _
	#  / ___|___  _ __  ___  ___ | (_) __| | __ _| |_ ___
	# | |   / _ \| '_ \/ __|/ _ \| | |/ _` |/ _` | __/ _ \
		# | |__| (_) | | | \__ \ (_) | | | (_| | (_| | ||  __/
	#  \____\___/|_| |_|___/\___/|_|_|\__,_|\__,_|\__\___|
	#
	# Pull together Todyn (dynamic todo)
	cd $HOMEDIR
	cat Calendar.txt Beeminder-all.txt Pivotal.txt Todoy.txt Mailboxtodo.txt > $TMPFILE || logger -s -p3 "Error: Consolidation"
	# Mark as today
	echo "" >> $TMPFILE
	export PARENTPROCESS=`ps -ocommand= -p $PPID | awk -F/ '{print $NF}' | awk '{print $1}'`
	#echo $PATH >> $TMPFILE
	echo -e "\n`date '+%Y-%m-%d %H:%M:%S'` ${PARENTPROCESS}" >> $TMPFILE  || logger -s -p3 "Error: ${PARENTPROCESS}"
fi # end need to create new todyn
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

