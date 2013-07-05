#!/bin/bash

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
	--excludeAllDayEvents								\
	--includeCals "roland@rocketfuelinc.com,Roland Siebelink (TripIt),Big,Routines"			\
	--includeOnlyEventsFromNowOn						\
	eventsToday | grep -v "»" | grep -v "√"
