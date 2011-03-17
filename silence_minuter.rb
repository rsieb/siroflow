#!/usr/bin/env ruby

File.open("/Users/rs/Desktop/silent", 'w+')  do |f|
  f.write("#{Time.now()}")
end
