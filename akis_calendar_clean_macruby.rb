#!/usr/local/bin/macruby -KU
framework 'eventkit'
# CalCalendarStore.defaultCalendarStore.calendars.each do |calendar|


# print "\n" + calendar.uid + " " + calendar.title

# end
# TODO 2013-06-09 RS Activate this only for 80886C0A-BF70-4675-A640-B68BCEA85E91 = roland@rocketfuelinc.com

 
def colorize(text, color_code)
  "\e[0;#{color_code}m#{text}"
end
 
def black(text=""); colorize(text, 30); end
def red(text=""); colorize(text, 31); end
def green(text=""); colorize(text, 32); end
def yellow(text=""); colorize(text, 33); end
def blue(text=""); colorize(text, 34); end
def magenta(text=""); colorize(text, 35); end
def cyan(text=""); colorize(text, 36); end
def white(text=""); colorize(text, 37); end
 
def bold(&block)
  code = "\e[1m"
 
  if block_given?
    begin
      print code
      yield
    ensure
      print regular
    end
  else
    code
  end
end
 
def regular
  "\e[0m"
end
 

store = EKEventStore.alloc.initWithAccessToEntityTypes EKEntityTypeEvent | EKEntityTypeReminder
predicate = store.predicateForEventsWithStartDate NSDate.dateWithNaturalLanguageString('yesterday'),
              endDate: NSDate.dateWithNaturalLanguageString('next week'),
              calendars: NSCalendar.calendarWithIdentifier('118DD6E8-D84F-42DC-B0AB-B0A499C6EE91')

date = NSDateFormatter.new
date.setDateStyle NSDateFormatterLongStyle
date.setTimeStyle NSDateFormatterNoStyle
 
time = NSDateFormatter.new
time.setDateFormat "HH:mm"
 
events = store.eventsMatchingPredicate(predicate)

OnlyDate = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
 
require 'date'
 
class Time
  def midnight?
    [hour, min, sec, usec].all? { |val| val == 0 }
  end
end
 
class EKEvent
  def days
    calendar = NSCalendar.currentCalendar
 
    first = calendar.dateFromComponents(calendar.components OnlyDate, fromDate: self.startDate)
    last = calendar.dateFromComponents(calendar.components OnlyDate, fromDate: self.endDate)
 
    days = []
 
    next_day = NSDateComponents.new
    next_day.setDay 1
 
    date = first
 
    days << date
 
    while o = date.compare(last) and o == NSOrderedAscending
      date = calendar.dateByAddingComponents next_day, toDate: date, options: 0
      days << date
    end
 
    if not last.midnight? and not days.last == last
      days << last
    end
 
    days
  end
end
 
now = Time.now
table = Hash.new{|h,k| h[k] = [] }
 
events.each do |event|
  event.days.each do |day|
    table[day] << event
  end
end
 
# sort days
table = Hash[ table.sort_by{ |date, events| date } ]
 
table.each do |day, events|
 
  bold do
    puts date.stringFromDate(day)
  end
 
  # sort events
  events.sort_by(&:startDate).each do |event|
    print ' ' * 3
 
    start = event.startDate
    ends = event.endDate
 
    current = false
 
    if now > start and now < ends
      current = true
      print boldical
      if day.to_date == now.to_date
        print '✓'
      else
        print "\u2606" # 22c6
      end
      print regular
    else
      print ' '
    end
 
    print ' '
 
    # puts [event.allDay?, start, day, ends ].inspect
 
    if event.allDay? or start.to_date != day.to_date && ends.to_date != day.to_date
      print "(all day)\t"
    else
      if start.to_date == day.to_date
        print time.stringFromDate(start)
      else
        print "  \u21c7  "
      end
 
      print ' - '
 
      if ends.to_date == day.to_date
        print time.stringFromDate(ends)
      else
        print "  \u21c9  "
      end
    end
 
    print "\t"
 
    print bold if current
    print event.title
    print regular
 
    print " @ #{event.location}" if event.location and not event.location.empty?
    print "\n"
  end
 
  puts
end