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
  --includeCals "1/Bedrijfseenheidsleider,2/Verblijfsvergunning,3/Gezonder Dan Ooit,4/Goed Getrouwd,5/Sort SetInOrder Shine Standardize Sustain" \
  eventsToday 2>/dev/null  | grep -v 'Done' | cut -f 1 -d §  | cut -c 1-100 

printf "\n"

# /usr/local/bin/icalBuddy                                \
# 	--noPropertyNames                                   \
# 	--sectionSeparator ""                               \
# 	--bullet "" 										\
# 	--excludeEndDates 									\
# 	--timeFormat "%Hh%M" 								\
# 	--dateFormat "%a %d %b"								\
# 	--propertySeparators "/ /" 							\
# 	--excludeEventProps "url,attendees,location"  \
# 	--noCalendarNames									\
# 	--propertyOrder "title,notes"					\
# 	--propertySeparators "| |" \
# 	--noPropNames \
# 	--notesNewlineReplacement " " \
# 	--includeCals "roland@rocketfuelinc.com" \
# 	--excludeAllDayEvents                               \
# 	--excludeCals "Rocket Fuel Training" \
# 	eventsToday 2>/dev/null | grep "π" | cut -c 1-100 

# printf "\n"

/usr/local/bin/icalBuddy                                \
	--noPropertyNames                                   \
	--sectionSeparator ""                               \
	--bullet "" 										\
	--excludeEndDates 									\
	--timeFormat "%Hh%M" 								\
	--dateFormat "%a %d %b"								\
	--propertySeparators "/ /" 							\
	--excludeEventProps "url,attendees"  \
	--noCalendarNames									\
	--propertyOrder "datetime,title,location"					\
	--propertySeparators "| |" \
	--noPropNames \
	--notesNewlineReplacement "§" \
	--includeCals "roland@rocketfuelinc.com,roland@siebelink.org,Facebook Events,DSE Runners" \
	--excludeCals "Rocket Fuel Training" \
eventsToday 2>/dev/null | grep -v "»" | grep -v "√" | grep -v "π" | cut -f 1 -d § | cut -c 1-100 

printf "\n"

/usr/local/bin/icalBuddy                                \
	--noPropertyNames                                   \
	--sectionSeparator ""                               \
	--bullet "" 										\
	--excludeEndDates 									\
	--timeFormat "%Hh%M" 								\
	--dateFormat "%a %d %b"								\
	--propertySeparators "/ /" 							\
	--excludeEventProps "url,attendees,datetime,notes"  \
	--noCalendarNames									\
	--propertyOrder "title,location"					\
	--propertySeparators "| |" \
	--noPropNames \
	--notesNewlineReplacement "§" \
	--includeCals "Tripit,Routines,Quality time" \
eventsFrom:"` date -v '-1H'`" to:"` date -v '+2H'`" 2>/dev/null | grep -v "»" | grep -v "√" | grep -v "π" | cut -f 1 -d § | cut -c 1-100 
