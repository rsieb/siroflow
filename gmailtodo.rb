#!/usr/bin/env ruby -KU
# encoding: UTF-8

require 'rubygems'
require 'gmail'
require 'pp'

Gmail.new('roland@rocketfuelinc.com', 'bhwacmjjnbggsfzk') do |gmail|
  # send commands
  todobox = gmail.mailbox('[Mailbox]/To Do')
  mymails = todobox.emails
  mymails.each do |msg|
    mytask = msg.subject
    unless ( mytask =~ /Re:/i || mytask =~ /AW:/i )
      puts '#{mytask} +gmail'
    end
  end

end
