#!/bin/bash

if [ /Users/rs/Desktop/allowmail -ot /tmp/com.rolandsiebelink.beeminder-autoupdate.out ]
	then
	for MAILAPP in "Sparrow" "Mailplane 3" "Mail"
		do
		killall $MAILAPP
	done
fi