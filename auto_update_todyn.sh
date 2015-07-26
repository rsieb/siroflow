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

/usr/local/bin/todo.sh report

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
if ! [ "`ping -c 1 google.com`" ] ; then
	logger -s -p4 "We are not online."
	ONLINE=
else
	logger -s -p6 "We are online."
	ONLINE=true
fi
#export ONLINE=true

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
	logger -s -p4 "$TMPFILE updated LESS than one minute ago."
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

>>>>>>> Stashed changes

if grep -q "PREZMODE" /tmp/routinetracker.log ; then
	exit "PREZMODE"
fi

<<<<<<< Updated upstream
#   ___        _ _                          _
#  / _ \ _ __ | (_)_ __   ___    ___  _ __ | |_   _
# | | | | '_ \| | | '_ \ / _ \  / _ \| '_ \| | | | |
# | |_| | | | | | | | | |  __/ | (_) | | | | | |_| |
#  \___/|_| |_|_|_|_| |_|\___|  \___/|_| |_|_|\__, |
#                                             |___/
if ! [ "`ping -c 1 beeminder.com`" ];
	then
	logger -s -p2 "We are not online. Aborting."
	exit
else
	logger -s -p5 "We are online. Continuing."
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
		#  ____                     ____        _ _      ___
		# |  _ \  ___  _ __   ___  |  _ \  __ _(_) |_   |__ \
		# | | | |/ _ \| '_ \ / _ \ | | | |/ _` | | | | | |/ /
		# | |_| | (_) | | | |  __/ | |_| | (_| | | | |_| |_|
		# |____/ \___/|_| |_|\___| |____/ \__,_|_|_|\__, (_)
		#                                           |___/
		# Do we need to update the daily goals first? Is Todoy older than 00:01 today?
		if [[ ! -f $TODOYFILE || ! -f $DAYBREAK || `find $DAYBREAK -newer $TODOYFILE` ]]
			then
			logger -s -p5 "Performing 'add_daily_to_todoy.sh' "
			#say "I would update Beeminder now"
			source $DIR/add_daily_to_todoy.sh || logger -s -p3 "Error: 'add_daily_to_todoy.sh' " 
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
	else
		logger -s -p5 "Todyn updated less than one minute ago... Aborting."
	fi # end need to create new todyn
fi # end are we online
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
=======
#    \       |     | _ \      _) |      
#   _ \   _` |  _` | |  | _` | | | |  | 
# _/  _\\__,_|\__,_|___/\__,_|_|_|\_, | 
#                                 ___/  

touch -t `date '+%m%d0330'` $DAYBREAK # reset the DAYBREAK marker to 03:30am today
# ls -l $TODOYFILE $DAYBREAK
if [[ $TODOYNEEDED || $DAYBREAKNEEDED || $NEEDFRESHTODOY ]]
	then
	logger -s -p5 "Performing 'add_daily_to_todoy.sh' "
	#say "I would update Beeminder now"
	source $DIR/add_daily_to_todoy.sh && logger -s -p6 "Worked: 'add_daily_to_todoy.sh'" || logger -s -p3 "Error: 'add_daily_to_todoy.sh' " 
else
	logger -s -p5 "Skipped 'add_daily_to_todoy.sh'"
fi

# __ __|         |             
#    |  _ \   _` | |   | __ \  
#    | (   | (   | |   | |   | 
#   _|\___/ \__,_|\__, |_|  _| 
#                 ____/        

if [[ $ONLINE && ( $TMPFILENEEDED || $WAITAMINUTE ) ]]
	then
	logger -s -p6 "Starting update..."
	touch $TMPFILE # update time stamp so that the script cannot run twice in parallel

# #  ____  _            __ _               
# # / ___|(_)_ __ ___  / _| | _____      __
# # \___ \| | '__/ _ \| |_| |/ _ \ \ /\ / /
# #  ___) | | | | (_) |  _| | (_) \ V  V / 
# # |____/|_|_|  \___/|_| |_|\___/ \_/\_/  

# MYFILE="$HOMEDIR/Siroflow.txt"
# printf "\n" > "$MYFILE"

# cd /Users/rs/ndb_projects/siroflow/

# 	# ./bin/rake update_trello && /usr/bin/curl http://localhost:3000/assignments.txt | egrep '/D'>> "$MYFILE" 2>/dev/null && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
# 	/Users/rs/.rbenv/shims/heroku run rake update_trello && /usr/bin/curl https://pure-ridge-9634.herokuapp.com/assignments.txt  | egrep '/D' | head -7 >> "$MYFILE"  2>/dev/null && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
# 	cd /Users/rs/rt

	#  _____         _       _        _   
	# |_   _|__   __| | ___ | |___  _| |_ 
	#   | |/ _ \ / _` |/ _ \| __\ \/ / __|
	#   | | (_) | (_| | (_) | |_ >  <| |_ 
	#   |_|\___/ \__,_|\___(_)__/_/\_\\__|

	MYFILE="$HOMEDIR/Todotxt.txt"
	printf "\n" > "$MYFILE"

	#cat  /Users/rs/Dropbox/Todo/todo.txt | egrep '\(\w\)' >> "$MYFILE"  2>/dev/null && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
	echo "TODO.TXT PRIORITIES" >> "$MYFILE" 
	todo.sh -p ls | egrep '\(A\)' | sed -E 's/[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2} //' | sort -r  >> "$MYFILE"  2>/dev/null && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
	echo "TODO.TXT DUE" >> "$MYFILE" 
	todo.sh -p ls | egrep 'due:`date +%Y-%m-%d`' | sort -r >> "$MYFILE"  2>/dev/null && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
	cd /Users/rs/rt


	#  ____                      _           _
	# | __ )  ___  ___ _ __ ___ (_)_ __   __| | ___ _ __
	# |  _ \ / _ \/ _ \ '_ ` _ \| | '_ \ / _` |/ _ \ '__|
	# | |_) |  __/  __/ | | | | | | | | | (_| |  __/ |
	# |____/ \___|\___|_| |_| |_|_|_| |_|\__,_|\___|_|
	#
	MYFILE="$HOMEDIR/Beeminder-all.txt"
	printf "\n" > "$MYFILE"
	#source $DIR/beeminder-pull-endangered.sh | sort -r | head -4 >> "$MYFILE"  2>&1 || logger -s -p3 "Error: 'beeminder-pull-endangered.sh'"
	source $DIR/beeminder-pull-endangered.sh | sort -r | head -4 >> "$MYFILE"  2>&1 && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"

	# #  ____  _            _        _
	# # |  _ \(_)_   _____ | |_ __ _| |
	# # | |_) | \ \ / / _ \| __/ _` | |
	# # |  __/| |\ V / (_) | || (_| | |
	# # |_|   |_| \_/ \___/ \__\__,_|_|
	# #
	# # from Pivotal tracker
	# MYFILE="$HOMEDIR/Pivotal.txt"
	# #echo "# From Pivotal... #" > "$MYFILE"
	# printf "\n" > "$MYFILE"
	# # if [[ $(date +%u) -ne 6 ]] # no proactive work on Saturdays
	# # then
	# ## leave next line commented out or it leaves me never to look at pivotal again
	# # ruby -KT $DIR/pivotal_finished_reset.rb || logger -s -p3 "Error: pivotal_finished_reset.rb"

	# #ruby -KT $DIR/pivotal_pull_active.rb | head -3 >> "$MYFILE"  2>&1 || logger -s -p3 "Error: ${MYFILE}"
	# ruby -KT $DIR/pivotal_pull_active.rb  | head -4 >> "$MYFILE"  2>&1  && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
	# # fi
	# #echo "\n" >> "$MYFILE"
	# #say "Pivotal updated"

	# # #      _ _            ___  ___ 
	# # #     | (_)_ __ __ _ / _ \|_ _|
	# # #  _  | | | '__/ _` | | | || | 
	# # # | |_| | | | | (_| | |_| || | 
	# # #  \___/|_|_|  \__,_|\__\_\___|

	# MYFILE="$HOMEDIR/JiraQuery.txt"
	# echo "\n" > "$MYFILE"

	# ruby -KT $DIR/jira_pull_active.rb >> "$MYFILE"  2>&1 && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
	# # fi
	# echo "\n" >> "$MYFILE"
	# #say "Pivotal updated"



	#   ____      _                _
	#  / ___|__ _| | ___ _ __   __| | __ _ _ __
	# | |   / _` | |/ _ \ '_ \ / _` |/ _` | '__|
	# | |__| (_| | |  __/ | | | (_| | (_| | |
	#  \____\__,_|_|\___|_| |_|\__,_|\__,_|_|
	#
	# and add meetings from icalendarbuddy and mark as today
	MYFILE="$HOMEDIR/Calendar.txt"
	#echo "\n# From Calendar... #" > "$MYFILE"
	printf "\n" > "$MYFILE"
	bash $DIR/calendar_events_today.sh >> "$MYFILE" 2>&1 && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: ${MYFILE}"
	#cat $MYFILE 
	#say "Calendar updated"

	# __        __          _ _               _ 
	# \ \      / /_ _ _ __ (_) | ____ _ _ __ (_)
	#  \ \ /\ / / _` | '_ \| | |/ / _` | '_ \| |
	#   \ V  V / (_| | | | | |   < (_| | | | | |
	#    \_/\_/ \__,_|_| |_|_|_|\_\__,_|_| |_|_|

	#
	MYFILE="$HOMEDIR/Wanikani.txt"
	printf "\n" > "$MYFILE"
	#	echo "Wanikani reviews: `ruby -KT $DIR/wanikani-lessons.rb` +rout\n" | sort -u >> "$MYFILE" && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: Mailboxtodo-import"
	echo "Wanikani `ruby -KT $DIR/wanikani-progress.rb` " | sort -u >> "$MYFILE" && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: Mailboxtodo-import"

	# #   ____                 _ _ _____         _
	# #  / ___|_ __ ___   __ _(_) |_   _|__   __| | ___
	# # | |  _| '_ ` _ \ / _` | | | | |/ _ \ / _` |/ _ \
	# # | |_| | | | | | | (_| | | | | | (_) | (_| | (_) |
	# #  \____|_| |_| |_|\__,_|_|_| |_|\___/ \__,_|\___/
	# #
	# # and add subjects from Mailbox/todo
	# MYFILE="$HOMEDIR/Planleaf.txt"
	# #echo "\n# From Mailbox/ToDo... #" > "$MYFILE"
	# printf "\n" > "$MYFILE"
	# #ruby -KT /Users/rs/rt/gmailtodo.rb | head -3 >> "$MYFILE" || logger -s -p3 "Error: ${MYFILE}"
	# ruby -KT $DIR/gmailtodo.rb | sort -u >> "$MYFILE" && logger -s -p6 "Worked: ${MYFILE}" || logger -s -p3 "Error: Mailboxtodo-import"
	# #say "Mailbox-to-do updated"


	#   ____                      _ _     _       _
	#  / ___|___  _ __  ___  ___ | (_) __| | __ _| |_ ___
	# | |   / _ \| '_ \/ __|/ _ \| | |/ _` |/ _` | __/ _ \
	# | |__| (_) | | | \__ \ (_) | | | (_| | (_| | ||  __/
	#  \____\___/|_| |_|___/\___/|_|_|\__,_|\__,_|\__\___|
	#
	# Pull together Todyn (dynamic todo)
	cd $HOMEDIR
	# first ensure there are no white lines in Todont
	if [[ -s $TODONTFILE ]] ; then
		#cat -s $TODONTFILE > /tmp/Todont.txt && logger -s -p6 "Worked: ${TODONTFILE} white lines removal" || logger -s -p3 "Error: ${TODONTFILE} white lines removal"
		grep -v '^$' $TODONTFILE > /tmp/Todont.txt && logger -s -p6 "Worked: ${TODONTFILE} white lines removal" || logger -s -p3 "Error: ${TODONTFILE} white lines removal"
		cp /tmp/Todont.txt $TODONTFILE && logger -s -p6 "Worked: copying ${TODONTFILE}" || logger -s -p3 "Error: copying ${TODONTFILE}"
	else
		echo "`date '+%Y-%m-%d %H:%M:%S'`" > $TODONTFILE && logger -s -p6 "Worked: header date" || logger -s -p3 "Error: Header date"
	fi
	#cat $TODONTFILE 
	# and generate clean TODYNFILE
	# echo "`date '+%Y-%m-%d %H:%M:%S'`" > $TODYNFILE && logger -s -p6 "Worked: header date" || logger -s -p3 "Error: Header date"
  echo 'Todo.txt up to date `7' > $TODYNFILE && logger -s -p6 "Worked: Todo.txt UTD" || logger -s -p3 "Error: Header Todo.txt UTD"
	#echo "`fortune`" > $TODYNFILE && logger -s -p6 "Worked: Wanikani header" || logger -s -p3 "Error: Header date"
  # now match every generated file against the tasks already done today
	for FILENAME in Todotxt Calendar Beeminder-all Wanikani
	# for FILENAME in Beeminder-all Siroflow Todoy Calendar Wanikani 
	do
		grep --invert-match --fixed-strings --file=$TODONTFILE $FILENAME.txt | cat -s >> $TODYNFILE  && logger -s -p6 "Worked: grepping ${FILENAME}.txt" || logger -s -p3 "Error: ${FILENAME}.txt deduplication"
	done
	# Mark as today
	#echo "+cdng" >> $TODYNFILE && logger -s -p6 "Worked: Wanikani footer +cdng" || logger -s -p3 "Error: Header +cdng"
	echo "" >> $TODYNFILE
	#/usr/local/bin/todo.sh birdseye open-projects | grep '\[' | cut -c 4- | sort -n >> $TODYNFILE && logger -s -p6 "Worked: Birdseye" || logger -s -p3 "Error: Birdseye"
  export PARENTPROCESS=`ps -ocommand= -p $PPID | awk -F/ '{print $NF}' | awk '{print $1}'`
	#echo $PATH >> $TMPFILE
	echo "`date '+%Y-%m-%d %H:%M:%S'` ${PARENTPROCESS}" >> $TODYNFILE  || logger -s -p3 "Error: ${PARENTPROCESS}"
fi # end need to create new todyn
#cat $TODYNFILE
# #   ____ _                                  _____         _             _
# #  / ___| | ___  __ _ _ __    _   _ _ __   |_   _|__   __| | ___  _ __ | |_
# # | |   | |/ _ \/ _` | '_ \  | | | | '_ \    | |/ _ \ / _` |/ _ \| '_ \| __|
# # | |___| |  __/ (_| | | | | | |_| | |_) |   | | (_) | (_| | (_) | | | | |_
# #  \____|_|\___|\__,_|_| |_|  \__,_| .__/    |_|\___/ \__,_|\___/|_| |_|\__|
# #                                  |_|
# #
# # Take out ignored lines
# # subtracting two files from each other as per <http://aijazansari.com/2011/11/23/how-to-subtract-one-file-from-another/>
# # NB file with negative lines should come first :)
# logger -s -p3 "Starting cleanup"
# if [[ -s $TODONTFILE ]] ; then
# 	# first ensure there are no white lines in Todont
# 	logger -s -p3 "Starting grep"
# 	grep -v '^$' $TODONTFILE > /tmp/Todont.txt || logger -s -p3 "Error: ${TODONTFILE} white lines removal"
# 	logger -s -p3 "Copying todontfile"
# 	cp /tmp/Todont.txt $TODONTFILE
# 	# now take all the ignorable lines out of the temporary Todyn by matching against Todont
# 	logger -s -p3 "Taking the lines out"
# 	#grep --invert-match --line-regexp --file=$TODONTFILE $TMPFILE | cat -s > $TODYNFILE   || logger -s -p3 "Error: ${TODONTFILE} deduplication"
# 	grep --invert-match --fixed-strings --file=$TODONTFILE $TMPFILE | cat -s > $TODYNFILE   || logger -s -p3 "Error: ${TODONTFILE} deduplication"
