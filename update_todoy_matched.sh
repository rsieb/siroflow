#!/bin/bash

OLDROOT="/Users/rs/Library/Application Support/Notational Data"
ROOT="/Users/rs/Dropbox/Elements"

# ## move first line of todo to todone
# echo `date +'%a %Y-%m-%d %H:%M'` `head -n +1 "$ROOT/Todoy.txt"` > /tmp/todone.txt && say `cat /tmp/todone.txt` && cat "$ROOT/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "$ROOT/Todone.txt" && say "todone updated"
# 
# ## cut first line of todo
# tail -n +2 "$ROOT/Todoy.txt" > /tmp/todoy.txt && mv /tmp/todoy.txt "$ROOT/Todoy.txt" && say "todo updated"

# ## move matching line of todo to todone
# echo "ARGV1 comes out as $argv[1]" > "/tmp/mymatch.txt"
# echo "Dollar1 comes out as $1" >> "/tmp/mymatch.txt"
export MYMATCH=$1
#export MYNEW=$2
echo "My match comes out as /${MYMATCH}/" > "/tmp/mymatch.txt"

echo `date +'%a %Y-%m-%d %H:%M'` $MYMATCH > /tmp/todone.txt && cat "$ROOT/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "$ROOT/Todone.txt" && say "todone updated"

## cut matching line of todo
/usr/bin/grep -v "${MYMATCH}" $ROOT/Todoy.txt > /tmp/todoy.txt && mv /tmp/todoy.txt $ROOT/Todoy.txt && say "todo updated 1"

export MYMATCHCHOPPED=`echo $MYMATCH | sed s/.$//`
/usr/bin/grep -v "${MYMATCHCHOPPED}" $ROOT/Todoy.txt > /tmp/todoy.txt && mv /tmp/todoy.txt $ROOT/Todoy.txt && say "todo updated 2"
#echo "√${MYMATCH}" >> $ROOT/Todoy.txt && say "todo updated 3"
