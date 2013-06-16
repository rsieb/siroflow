#!/bin/bash

/usr/local/bin/icalBuddy --noPropertyNames --sectionSeparator "" -b "" -eed --timeFormat "%Hh%M" --dateFormat "%a %d %b" --propertySeparators "/ /" --excludeEventProps "url,notes,location,attendees"  --noCalendarNames --propertyOrder "datetime,title" --includeCals "roland@rocketfuelinc.com" eventsToday | grep -v "»" | grep -v "√"
