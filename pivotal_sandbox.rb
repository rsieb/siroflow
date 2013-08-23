#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'
require 'chronic'

@mystate = ["started,unstarted,finished"]

@mytoken = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token
@mystories = Array.new()

@myprojects = [781813] # take out FUEL 780227,786005,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all(:current_state => @mystate)
  #@mystories = @mystories + @a_project.stories.all()
end

#puts @mystories.inspect
@mystories.each{|conte|
  puts "#{conte.name} #{conte.labels}"
}
