#!/usr/bin/env ruby -wKU
# encoding: UTF-8

#ψ load relevant modules
require 'rubygems'
require 'appscript'
require 'time'
require 'chronic'
#require 'activesupport'
require 'yaml'

# =============
# = VARIABLES =
# =============
@mijnkalenders=['roland@rocketfuelinc.com'] # TODO RS 2012-08-27 adding work calender here does not work

#ψ initialize variables
@cleantime=Chronic.parse("7 days ago")
ical = Appscript::app('Calendar')

#ψ get relevant data from ical

@mijnkalenders.each do |kalendertje| 
  ical.calendars[kalendertje].events.get.each do |afspraak|
    @summary = afspraak.summary.get
    @starttime = afspraak.start_date.get
    if (@starttime < @cleantime && @summary.start_with?("√")) then
      #afspraak.delete
      puts "#{@starttime.strftime("%Y%m%d%H%M")} #{@summary}"
      puts " Would be deleted"
    end
  end
end
