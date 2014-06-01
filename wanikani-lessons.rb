#!/usr/bin/env ruby -KU

require 'bundler/setup'
require 'wanikani'

Wanikani.api_key = "7af4ab9dbbe7b49a5b9b504903d89d15"

# Wanikani::User.information
#   # => {"username"=>"crabigator", "gravatar"=>"gravatarkey", "level"=>25, "title"=>"Turtles", "about"=>"I am the almighty crabigator!", "website"=>"http://www.wanikani.com/", "twitter"=>"WaniKaniApp", "topics_count"=>1000, "posts_count"=>500, "creation_date"=>1337820000, "vacation_date"=>null}

# Wanikani::User.on_vacation?
#   # => false

puts Wanikani::StudyQueue.queue['reviews_available']
