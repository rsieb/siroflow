#!/usr/bin/env ruby -wKU

require 'liftapp-client'
require 'pp'

client = Liftapp::Client.new('lift.do@rolandsiebelink.com', 'meb0y?Qatar')
#puts client.profile_hash
data = client.dashboard
#pp data
totalcheckins = 0
data['subscriptions'].each do |subscription|
  totalcheckins = totalcheckins + subscription['stats']['total_checkins'].to_i
end

puts totalcheckins
