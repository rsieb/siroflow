#!/usr/local/bin/macruby -wKU

require 'rubygems'
require 'pp'

framework 'calendarstore'
# CalCalendarStore.defaultCalendarStore.calendars.each do |calendar|

# print "\n" + calendar.uid + " " + calendar.title

# end
# TODO 2013-06-09 RS Activate this only for 80886C0A-BF70-4675-A640-B68BCEA85E91 = roland@rocketfuelinc.com

period = (30 * 24 * 3600) # one month
range = Time.now..(Time.now+period)
puts range.to_s
cal = CalCalendarStore.defaultCalendarStore.calendarWithUID("80886C0A-BF70-4675-A640-B68BCEA85E91")

predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:[cal])

# Inside the block everything except #timeIntervalSince1970 is normal ruby,
# so it should be pretty easy for many people to change around.

CalCalendarStore.defaultCalendarStore.eventsWithPredicate(predicate).each do |event|
  #started_at = Time.at(event.startDate.timeIntervalSince1970)
  if ( event.title.start_with?("√") || event.title.start_with?("»") )
    puts "\n\n%%% #{event.title.upcase} %%%"
    event.alarms.each do |buzzer|
      pp event
      pp buzzer
      #pp buzzer.methods
      event.removeAlarm(buzzer)
    end
  end
end
