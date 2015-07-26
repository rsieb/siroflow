#!/bin/bash
source '/Users/rs/.bash_include_rs'

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
  --propertyOrder "title,datetime,location"         \
  --propertySeparators "| |" \
  --noPropNames \
  --includeOnlyEventsFromNowOn \
  --noRelativeDates \
  --notesNewlineReplacement "§" \
  --includeCals "roland@rocketfuelinc.com,roland@siebelink.org,Facebook Events,DSE Runners,Tripit,Quality time,Proposed" \
  --excludeCals "Rocket Fuel Training" \
eventsToday | grep -v "'" | grep -v "»" | grep -v '@W' | grep -v "√" | grep -v "π" 
#eventsToday | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π" | cut -f 1 -d"§" | cut -c 1-100


# printf "\n"

# echo "ROUTINES TODAY"
# /usr/local/bin/icalBuddy                                \
#   --noPropertyNames                                   \
#   --sectionSeparator ""                               \
#   --bullet ""                     \
#   --excludeEndDates                   \
#   --timeFormat "%Hh%M"                \
#   --dateFormat "%a %d %b"               \
#   --propertySeparators "/ /"              \
#   --excludeEventProps "url,attendees,datetime,notes"  \
#   --noCalendarNames                 \
#   --propertyOrder "title,location"          \
#   --propertySeparators "| |" \
#   --noPropNames \
#   --notesNewlineReplacement "§" \
#   --includeCals "Tripit,Routines,Quality time,Proposed" \
# eventsFrom:"` date -v '-1H'`" to:"` date -v '+2H'`" | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π"
# #eventsFrom:"` date -v '-1H'`" to:"` date -v '+2H'`" | grep -v "'" | grep -v "»" | grep -v "√" | grep -v "π" | cut -f 1 -d"§" | cut -c 1-100