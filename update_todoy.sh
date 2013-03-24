#!/bin/bash

OLDROOT="/Users/rs/Library/Application Support/Notational Data"
ROOT="/Users/rs/Dropbox/Elements"

## move first line of todo to todone
echo `date +'%a %Y-%m-%d %H:%M'` `head -n +1 "$ROOT/Todoy.txt"` > /tmp/todone.txt && say `cat /tmp/todone.txt` && cat "$ROOT/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "$ROOT/Todone.txt" && say "todone updated"

## cut first line of todo
tail -n +2 "$ROOT/Todoy.txt" > /tmp/todoy.txt && mv /tmp/todoy.txt "$ROOT/Todoy.txt" && say "todo updated"

# # ## move matching line of todo to todone
# export MYMATCH=$1
# echo `date +'%a %Y-%m-%d %H:%M'` $MYMATCH > /tmp/todone.txt && cat "$ROOT/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "$ROOT/Todone.txt" && say "todone updated"

# ## cut matching line of todo
# sed -e "/${MYMATCH}/d" "$ROOT/Todoy.txt" > /tmp/todoy.txt && mv /tmp/todoy.txt "$ROOT/Todoy.txt" && say "todo updated"