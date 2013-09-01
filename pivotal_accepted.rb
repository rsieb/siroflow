#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'chronic'
require 'pivotal-tracker'
require '/Users/rs/rt/Beeminder.rb'

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@a_project = PivotalTracker::Project.find("781813")
@mystories = @a_project.stories.all(:state => "Accepted",  :includedone => :true )
@yesterday = Array.new
@mypoints = 0
@mystories.each do |verhaaltje|
	if verhaaltje.estimate then
  @mypoints = @mypoints + verhaaltje.estimate
end
  if verhaaltje.accepted_at.strftime("%Y-%m-%d") == Chronic::parse("yesterday").strftime("%Y-%m-%d")
    @yesterday.unshift("#{verhaaltje.estimate}|#{verhaaltje.name}")
  end
end
b = RoutineTracker::Minder.new(SECRETCODE)

b.sendoff("stories",@mypoints, "#{@yesterday.join(", ")} -- added #{Time.now.strftime("%F %X%z")}")

puts "#{@mypoints} \"#{@yesterday.join("; ")} -- added #{Time.now.strftime("%F %X%z")}\" "
