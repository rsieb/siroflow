#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require 'appscript'
require 'pp'

###read the currently planned task from iCal
@events = Appscript::app("iCal").calendars["Planning"].events.get

@current = @events.find_all{|mtg|
  mtg.start_date.get < Time.now() &&
  mtg.end_date.get > Time.now()
}.first.summary.get

###start a pomodoro with the currently planned task

unless  ( !@current || @current == :missing_value )
  begin
    Appscript::app("Pomodoro").start("#{@current} ", :duration => 25)
  rescue Exception => e
    puts "Error starting Pomodoro"
    puts e.message
    puts e.backtrace.inspect
  end  
end
