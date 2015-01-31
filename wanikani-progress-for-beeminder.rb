#!/usr/bin/env ruby -KU

require 'bundler/setup'
require 'wanikani'

Wanikani.api_key = "7af4ab9dbbe7b49a5b9b504903d89d15"

level = Wanikani::User.information['level']

done = Wanikani::Level.progression['kanji_progress']
total = Wanikani::Level.progression['kanji_total']
progress = level.to_f + (done.to_f / total.to_f )

puts "#{progress}"
