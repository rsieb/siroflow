#!/bin/bash

if [ /Users/rs/Desktop/allowmail -ot /tmp/pomodorodone.log ]
	then
	for MAILAPP in "Sparrow" "Mailplane 3" "Mail"
		do
		killall $MAILAPP
	done
fi