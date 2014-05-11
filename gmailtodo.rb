#!/usr/bin/env ruby -KU
# encoding: UTF-8

require 'bundler/setup'
#require 'rubygems'
# require 'gmail'
# require 'pp'
# require 'curb'

Gmail.new('roland@rocketfuelinc.com', 'bhwacmjjnbggsfzk') do |gmail|
  # send commands
  todobox = gmail.mailbox('[Mailbox]/To Do')
  mymails = todobox.emails
  mymails.each do |msg|
    mytask = "#{msg.subject} (#{msg.from[0]['mailbox']}) "
    mytask << "#{Date.parse(msg.date).strftime('%a %b %m')}"
      puts "#{mytask} +gmail"
      #rubocop:disable all
      poststring = ''
      poststring << 'curl -H "X-TrackerToken: d5272fd3c89dc76548d3278f3cb90948" '
      poststring << '-X POST -H "Content-type: application/xml" '
      poststring << '-d "<story><story_type>feature</story_type>'
      poststring << "<name>#{mytask}</name>"
      poststring << '<requested_by>Roland Siebelink</requested_by>'
      poststring << '<owned_by>Roland Siebelink</owned_by></story>" '
      poststring << 'http://www.pivotaltracker.com/services/v3/projects/781813/stories'
    unless ( mytask =~ /Re:/i || mytask =~ /AW:/i )
      result = system(poststring) 
    end
    unless result == false
      msg.move_to!("TodoImported")
    end
  end

end
