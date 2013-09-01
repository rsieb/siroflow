#!/usr/bin/env ruby -wKU

keys = Array.new
f = File.open("/Users/rs/Dropbox/Elements/JiraDaily.txt")
f.each_line {|line|
  keys.push line.chop
}
f.close
puts keys.inspect
keys.each do |sleutel|
  system("osascript -e 'tell  app \"JIRA.app\" to open location \"https://rocketfuel.jira.com/browse/#{sleutel}\" ' ")
end
