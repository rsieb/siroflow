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
	--includeCals "roland@rocketfuelinc.com,roland@siebelink.org,Tripit,Routines,Facebook Events,DSE Runners,SaneReminders,FollowUpThen" \
	--includeOnlyEventsFromNowOn						\
	eventsToday 2>/dev/null | grep -v "»" | grep -v "√" | head -5


# /usr/local/bin/icalBuddy                                \
#	--excludeAllDayEvents                               \
# 	--noPropertyNames                                   \
# 	--sectionSeparator ""                               \
# 	--bullet "" 										\
# 	--excludeEndDates 									\
# 	--timeFormat "%Hh%M" 								\
# 	--dateFormat "%a %d %b"								\
# 	--propertySeparators "/ /" 							\
# 	--excludeEventProps "url,notes,location,attendees"  \
# 	--noCalendarNames									\
# 	--propertyOrder "datetime,title"					\
# 	--includeCals "Big,DSE Runners" \
# 	--includeOnlyEventsFromNowOn						\
# 	--limitItems 1                                      \
# 	eventsToday+7 | grep -v "Folding"

#--excludeAllDayEvents								\
