#!/bin/bash


#HOMEDIR="/Users/rs/Library/Application Support/Notational Data"
HOMEDIR="/Users/rs/Dropbox/Elements"
# ## move first line of todo to todone
# echo `date +'%a %Y-%m-%d %H:%M'` `head -n +1 "${HOMEDIR}/Todoy.txt"` > /tmp/todone.txt && cat "${HOMEDIR}/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "${HOMEDIR}/Todone.txt" && say "todone updated"

# check if this script has run already today
LASTLINE=`/usr/bin/tail -1 "/Users/rs/Dropbox/Elements/Todoy.txt"`

# add daily to todoy
/bin/cat "${HOMEDIR}/Todoy.txt" > "/tmp/todoy.txt"
/bin/cat "${HOMEDIR}/Todoweekly.txt" >> "/tmp/todoy.txt"

# add tomorrow and someday to todoy
echo -e "\n# Someday/Maybe... #\n" >> "/tmp/todoy.txt"
/bin/cat "${HOMEDIR}/Todomeday.txt" >> "/tmp/todoy.txt"

# now copy the new file into place
/bin/rm "${HOMEDIR}/Todoy.txt"
/bin/mv "/tmp/todoy.txt" "${HOMEDIR}/Todoy.txt"
#/usr/bin/touch "/tmp/${TODAYDATE}.log"
#/usr/bin/say "todone updated"
