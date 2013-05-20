#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

@mystate = ["unstarted","unscheduled","started","rejected"]

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [780227,781813,786005] # take out FUEL ,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all(:current_state => @mystate)
end

@mynewstories = @mystories.sort_by {|i| i.name}
@mynewstories.each do |verhaaltje|
  if (verhaaltje.current_state != "unscheduled")
    puts "#{verhaaltje.name} #{verhaaltje.current_state}"
  end
end
