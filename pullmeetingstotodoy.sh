#!/bin/bash
source '/Users/rs/.bash_include_rs'

/usr/local/bin/icalBuddy                                \
	--noPropertyNames                                   \
	--sectionSeparator ""                               \
	--bullet "" 										\
	--excludeEndDates 									\
	--timeFormat "%Hh%M" 								\
	--dateFormat "%a %d %b"								\
	--propertySeparators "/ /" 							\
	--excludeEventProps "url,notes,location,attendees"  \
	--noCalendarNames									\
	--propertyOrder "datetime,title"					\
	--includeCals "roland@rocketfuelinc.com,Tripit,Big,Routines,Facebook Events,Insightly" \
	--includeOnlyEventsFromNowOn						\
	eventsToday | grep -v "»" | grep -v "√"

#--excludeAllDayEvents								\
