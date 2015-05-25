#!/bin/bash
source '/Users/rs/.bash_include_rs'

# echo $0
# echo `pwd`
# echo `which cut`

# echo "TRELLO DUE"
# /usr/local/bin/icalBuddy                                \
#   --noPropertyNames                                   \
#   --sectionSeparator ""                               \
#   --bullet ""                     \
#   --excludeEndDates                   \
#   --timeFormat "%Hh%M"                \
#   --dateFormat "%a %d %b"               \
#   --propertySeparators "/ /"              \
#   --noCalendarNames                 \
#   --includeEventProps "title,url"  \
#   --propertyOrder "title,url,notes"         \
#   --propertySeparators "| |" \
#   --noPropNames \
#   --notesNewlineReplacement "§" \
#   --includeCals "1/Bedrijfseenheidsleider,2/Verblijfsvergunning,3/GezondeBasis,4/Goed Getrouwd,5/Sort SetInOrder Shine Standardize Sustain,0/EchtDringend" \
#   eventsToday | grep -v "'" | grep -v 'Done' 
#   #eventsToday | cut -f 1 -d"§"  | cut -c 1-100 | grep -v "'" | grep -v 'Done' 

# printf "\n"

echo "EVENTS TODAY"

/usr/local/bin/icalBuddy                                \
  --noPropertyNames                                   \
  --sectionSeparator ""                               \
  --bullet ""                     \
  --excludeEndDates                   \
  --timeFormat "%Hh%M"                \
  --dateFormat ""               \
  --propertySeparators "/ /"              \
  --excludeEventProps "url,attendees,notes"  \
  --noCalendarNames                 \
  --propertyOrder "datetime,title,location"         \
  --propertySeparators "| |" \
  --noPropNames \
  --includeOnlyEventsFromNowOn \
  --noRelativeDates \
  --notesNewlineReplacement "§" \
  --includeCals "roland@rocketfuelinc.com,roland@siebelink.org,Facebook Events,DSE Runners" \
  --excludeCals "Rocket Fuel Training" \
eventsToday | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π" 
#eventsToday | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π" | cut -f 1 -d"§" | cut -c 1-100


printf "\n"

echo "ROUTINES TODAY"
/usr/local/bin/icalBuddy                                \
  --noPropertyNames                                   \
  --sectionSeparator ""                               \
  --bullet ""                     \
  --excludeEndDates                   \
  --timeFormat "%Hh%M"                \
  --dateFormat "%a %d %b"               \
  --propertySeparators "/ /"              \
  --excludeEventProps "url,attendees,datetime,notes"  \
  --noCalendarNames                 \
  --propertyOrder "title,location"          \
  --propertySeparators "| |" \
  --noPropNames \
  --notesNewlineReplacement "§" \
  --includeCals "Tripit,Routines,Quality time,Proposed" \
eventsFrom:"` date -v '-1H'`" to:"` date -v '+2H'`" | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π"
#eventsFrom:"` date -v '-1H'`" to:"` date -v '+2H'`" | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π" | cut -f 1 -d"§" | cut -c 1-100