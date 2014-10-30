#!/usr/bin/env ruby -KU
# encoding: UTF-8

# CLIENT ID 553359073392-o219it7rdp6hfs0rolr2u3u1fiaigf33.apps.googleusercontent.com
# EMAIL ADDRESS  553359073392-o219it7rdp6hfs0rolr2u3u1fiaigf33@developer.gserviceaccount.com
# PUBLIC KEY FINGERPRINTS   01f769eab30b6bd3875d8b862ab9dfe01efdbd61
# password = notasecret

# CLIENT ID 553359073392-sjha6njoor4d594o69pkapm6f6r350cd.apps.googleusercontent.com
# CLIENT SECRET  I2CfkujdN4wykOdbPkw4MUV1
# REDIRECT URIS
# urn:ietf:wg:oauth:2.0:oob
# http://localhost

# require 'gmail_xoauth'
# imap = Net::IMAP.new('imap.gmail.com', 993, usessl = true, certs = nil, verify = false)
# imap.authenticate('XOAUTH2', 'roland@rocketfuelinc.com', my_oauth2_token)
# messages_count = imap.status('INBOX', ['MESSAGES'])['MESSAGES']
# puts "Seeing #{messages_count} messages in INBOX"

#require 'bundler/setup'
#require 'rubygems'
require 'rubygems'
require 'gmail'
require 'base64'
require 'chronic'

# require 'pp'
# require 'curb'
totaldue = 0
gmail = Gmail.new("planleaf-daily-digest@rolandsiebelink.com", "qeb0y?Qatar")
gmail.inbox.emails(:from => "digest@planleaf.com", :after => Chronic.parse("yesterday"))[0..1].each do |latest|
  htmlcontent   = latest.parts.first
  inhoud        = htmlcontent.decode_body
  #puts inhoud
  due           = inhoud[/(\d+) Due+/]
  duetasks      = inhoud.match(/\nDue Today\n=+\n(-.*?)\n\n/m) || ["",""]
  #puts duetasks[1]
  odue          = inhoud[/(\d+) Overdue+/]
  oduetasks     = inhoud.match(/\nRecently Overdue\n=+\n(-.*?)\n\n/m) || ["",""]
  #puts oduetasks
  mysum = due.to_i + odue.to_i
  totaldue = totaldue + mysum
  if mysum > 0
    todoystring = oduetasks[1] + "\n" + duetasks[1] + "\n" 
    # todoystring = "PlanLeaf "
    # todoystring += odue
    # todoystring += ", "
    # todoystring += due
    # todoystring += " "
    # todoystring += inhoud[/roland\@(\S+)/][/\@(\S+)/]
    # todoystring += " "
    # todoystring += Time.now.strftime("%a %d/%b") +": "
      puts todoystring
  end
end
gmail.inbox.emails(:from => "digest@planleaf.com", :before => Chronic.parse("today")).each do |latest|
  latest.archive!
end

commentstring = "Auto-updated from gmailtodo.rb #{Time.now.strftime('%c')}"
system("beemind planleafdue #{totaldue} \"#{commentstring}\" ")


#   mymails = todobox.emails
# puts mymails
# mymails.each do |msg|
#   mytask = "#{msg.subject} (#{msg.from[0]['mailbox']}) "
#   mytask << "#{Date.parse(msg.date).strftime('%a %b %m')}"
#     puts "#{mytask} +gmail"
#     #rubocop:disable all
#     poststring = ''
#     poststring << 'curl -H "X-TrackerToken: d5272fd3c89dc76548d3278f3cb90948" '
#     poststring << '-X POST -H "Content-type: application/xml" '
#     poststring << '-d "<story><story_type>feature</story_type>'
#     poststring << "<name>#{mytask}</name>"
#     poststring << '<requested_by>Roland Siebelink</requested_by>'
#     poststring << '<owned_by>Roland Siebelink</owned_by></story>" '
#     poststring << 'http://www.pivotaltracker.com/services/v3/projects/781813/stories'
#   unless ( mytask =~ /Re:/i || mytask =~ /AW:/i )
#     result = system(poststring)
#   end
#   unless result == false
#     msg.move_to!("TodoImported")
#   end
# end

# end
