#!/usr/local/bin/macruby -KU
framework 'calendarstore'
# CalCalendarStore.defaultCalendarStore.calendars.each do |calendar|


# print "\n" + calendar.uid + " " + calendar.title

# end
# TODO 2013-06-09 RS Activate this only for 80886C0A-BF70-4675-A640-B68BCEA85E91 = roland@rocketfuelinc.com

#                 _     _           
#   __ _ _ __ ___| |__ (_)_   _____ 
#  / _` | '__/ __| '_ \| \ \ / / _ \
# | (_| | | | (__| | | | |\ V /  __/
#  \__,_|_|  \___|_| |_|_| \_/ \___|
                                  

period = (365 * 24 * 3600) # one year
maxduration = (3 * 3600) # three hours
#range = (Time.local(Time.now.year, Time.now.mon, Time.now.day)-period)..Time.local(Time.now.year, Time.now.mon, Time.now.day)
range = (Time.now - period)..(Time.now-maxduration)
#puts range.to_s
cal = CalCalendarStore.defaultCalendarStore.calendarWithUID("80886C0A-BF70-4675-A640-B68BCEA85E91")

predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:[cal])

# predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:CalCalendarStore.defaultCalendarStore.calendars)

# All formatting done here is intended to be RIGHT JUSTIFIED.
# Inside the block everything except #timeIntervalSince1970 is normal ruby,
# so it should be pretty easy for many people to change around.
CalCalendarStore.defaultCalendarStore.eventsWithPredicate(predicate).each do |event|
  started_at = Time.at(event.startDate.timeIntervalSince1970)
  if ( event.title.start_with?("√") || event.title.start_with?("»") )
    print event.startDate.to_s + " " + event.title
    CalCalendarStore.defaultCalendarStore.removeEvent(event, span:true, error:nil)
  end
end

#      _          _                         __       _                  
#   __| | ___  __| |_   _ _ __   ___       / _|_   _| |_ _   _ _ __ ___ 
#  / _` |/ _ \/ _` | | | | '_ \ / _ \_____| |_| | | | __| | | | '__/ _ \
# | (_| |  __/ (_| | |_| | |_) |  __/_____|  _| |_| | |_| |_| | | |  __/
#  \__,_|\___|\__,_|\__,_| .__/ \___|     |_|  \__,_|\__|\__,_|_|  \___|
#                        |_|                                            
 
@comingplaceholders = Hash.new

period = (4 * 7 * 24 * 3600) # four weeks ahead
range = (Time.now)..(Time.now+period)
#puts range.to_s
cal = CalCalendarStore.defaultCalendarStore.calendarWithUID("80886C0A-BF70-4675-A640-B68BCEA85E91")

predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:[cal])

# predicate = CalCalendarStore.eventPredicateWithStartDate(NSDate.dateWithString(range.begin.to_s), endDate:NSDate.dateWithString(range.end.to_s), calendars:CalCalendarStore.defaultCalendarStore.calendars)

# All formatting done here is intended to be RIGHT JUSTIFIED.
# Inside the block everything except #timeIntervalSince1970 is normal ruby,
# so it should be pretty easy for many people to change around.
CalCalendarStore.defaultCalendarStore.eventsWithPredicate(predicate).each do |event|
  if ( event.title.start_with?("√"))
  	#puts "\n\n"
  	#puts event.inspect
    started_at = event.startDate
    #puts started_at
    if !@comingplaceholders[started_at]
      @comingplaceholders[started_at] = event
    else
      #puts "Would delete #{started_at}"
      CalCalendarStore.defaultCalendarStore.removeEvent(event, span:true, error:nil)
    end
  end
end
