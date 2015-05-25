#!/bin/bash
source '/Users/rs/.bash_include_rs'

/usr/local/bin/icalBuddy                                \
  --noPropertyNames                                   \
  --sectionSeparator ""                               \
  --bullet ""                     \
  --excludeEndDates                   \
  --timeFormat "%Hh%M"                \
  --dateFormat "%a %d %b"               \
  --propertySeparators "/ /"              \
  --noCalendarNames                 \
  --includeEventProps "title,url,notes"  \
  --propertyOrder "title,url,notes"         \
  --propertySeparators "| |" \
  --noPropNames \
  --notesNewlineReplacement "§" \
  --includeCals "roland@rocketfuelinc.com"\
  eventsToday-7 | grep 'kg' | tail -1 | awk '{print $3}'  2>/dev/null
