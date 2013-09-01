#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'gmail'

Gmail.new("roland@rocketfuelinc.com", "bhwacmjjnbggsfzk") do |gmail|
  # send commands
  todobox = gmail.mailbox("[Mailbox]/To Do")
  mymails = todobox.emails
  mymails.each do |mailtje|
  	mijntaak = mailtje.subject
  	unless ( mijntaak =~ /Re:/i ||  mijntaak =~ /AW:/i )
  		puts "#{mijntaak} #{mailtje.from} +gmail"
  	end
  end

end
