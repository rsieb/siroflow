#!/bin/bash

## move first line of todo to todone
echo `date +'%a %Y-%m-%d %H:%M'` `head -n +1 "/Users/rs/Library/Application Support/Notational Data/Todoy.txt"` > /tmp/todone.txt && cat "/Users/rs/Library/Application Support/Notational Data/Todone.txt" >> /tmp/todone.txt && mv /tmp/todone.txt "/Users/rs/Library/Application Support/Notational Data/Todone.txt" && say "todone updated"

## cut first line of todo
tail -n +2 "/Users/rs/Library/Application Support/Notational Data/Todoy.txt" > /tmp/todoy.txt && mv /tmp/todoy.txt "/Users/rs/Library/Application Support/Notational Data/Todoy.txt" && say "todo updated"