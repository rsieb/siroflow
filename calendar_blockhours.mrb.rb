#!/usr/local/bin/macruby -KU
# framework 'calendarstore'
# duration = (4 * 3600)
# title = ARGV[0] rescue 'Blocking next hours for Pomodoro'

# # select the right calendar
# cal = CalCalendarStore.defaultCalendarStore.calendarWithUID("80886C0A-BF70-4675-A640-B68BCEA85E91")

# # create an event
# #_event = CalCalendarStore.defaultCalendarStore.createEvent(event, span:true, error:nil)

# # set the right parameters

# period = (10 * 24 * 3600) # one day


# #range = (Time.local(Time.now.year, Time.now.mon, Time.now.day)-period)..Time.local(Time.now.year, Time.now.mon, Time.now.day)
# range = (Time.now - period)..Time.now
# #puts range.to_s

# predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:[cal])

# # predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:CalCalendarStore.defaultCalendarStore.calendars)

# foundone = false
# CalCalendarStore.defaultCalendarStore.eventsWithPredicate(predicate).each do |event|
#   unless event.title.include?("アキ")

#     started_at = Time.at(event.startDate.timeIntervalSince1970)
#     if event.title.start_with?("»")
#       puts "#{event.title} #{event.startDate} #{event.endDate}"
#       if foundone == false
#         puts "moving hours around"
#         foundone = true
#         t = Time.now
#         event.startDate = t - t.sec - 60*t.min # round down to nearest hour
#         event.endDate = event.startDate + duration
#         event.title = "» #{title}"
#         puts "#{event.title} #{event.startDate} #{event.endDate}"
#         CalCalendarStore.defaultCalendarStore.saveEvent(event, span:true, error:nil)
#       else
#         puts "deleting"
#         CalCalendarStore.defaultCalendarStore.removeEvent(event, span:true, error:nil)
#       end
#     end
#   end
# end

# if foundone == false
#   puts "Could not find calendar blocking event, create one starting with » please"
# end

