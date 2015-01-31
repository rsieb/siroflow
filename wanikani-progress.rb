#!/usr/bin/env ruby -KU

require 'bundler/setup'
require 'wanikani'

Wanikani.api_key = "7af4ab9dbbe7b49a5b9b504903d89d15"

# Wanikani::User.information
#   # => {"username"=>"crabigator", "gravatar"=>"gravatarkey", "level"=>25, "title"=>"Turtles", "about"=>"I am the almighty crabigator!", "website"=>"http://www.wanikani.com/", "twitter"=>"WaniKaniApp", "topics_count"=>1000, "posts_count"=>500, "creation_date"=>1337820000, "vacation_date"=>null}

# Wanikani::User.on_vacation?
#   # => false

level = Wanikani::User.information['level']

done = Wanikani::Level.progression['kanji_progress']
total = Wanikani::Level.progression['kanji_total']
progress = level.to_f + (done.to_f / total.to_f )


percentage = ''
critical = Array.new
counters = [50,60,70,80,90,100]
counters.each do |counter|
  critical = Wanikani::CriticalItems.critical(counter)
  if critical.size > 0
    percentage = counter
    break
  end
end

criticalstring = ''
critical.each do |entry|
  criticalstring << " | "
  criticalstring << entry['character']
end

puts "#{progress} #{criticalstring} <#{percentage}% "
