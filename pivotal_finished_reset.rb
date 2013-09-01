#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

@mytoken = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token
@myprojects = [781813]

@mystate = ["finished"]
@mystories = Array.new()
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  #@mystories = @mystories + @a_project.stories.all(:state => @mystate, :owned_by => "Roland Siebelink")
  @mystories = @mystories + @a_project.stories.all(:state => @mystate)
end

@mystories.each do |verhaaltje|
  pp verhaaltje
  systemstring = <<-ENDOFCURL
  curl -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
    -d "<story><current_state>started</current_state></story>" \
    http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}
  ENDOFCURL
  system(systemstring)
end

@mystate2 = ["started"]
@mystories2 = Array.new()
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  #@mystories = @mystories + @a_project.stories.all(:state => @mystate, :owned_by => "Roland Siebelink")
  @mystories2 = @mystories2 + @a_project.stories.all(:state => @mystate2)
end

unless @mystories2.size <= 5
  @mystories2[5..-1].each do |verhaaltje2|
    #puts "#{verhaaltje2.current_state} #{verhaaltje2.name}"
    systemstring = <<-ENDOFCURL
    curl -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
      -d "<story><current_state>unstarted</current_state></story>" \
      http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje2.id}
    ENDOFCURL
    system(systemstring)
  end
end
