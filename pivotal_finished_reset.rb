# encoding: utf-8

#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

@mytoken = PivotalTracker::Client.token(
  'roland@rocketfuelinc.com',
  'qub0y?Qatar')
@myprojects = [781813]
  


# find all stories that are marked as started
@mystate2 = %w( started )
@mystories2 = Array[]
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories2 = @mystories2 + @a_project.stories.all(state: @mystate2)
end

# limit the number of stories marked as started to X
target_started_stories = 0
unless @mystories2.size <= target_started_stories
  @mystories2[target_started_stories..-1].each do |verhaaltje2|
    puts "@mystories2 = #{@mystories2.inspect}"
    puts "@verhaaltje2 = #{@verhaaltje2.inspect}"
    systemstring = <<-ENDOFCURL
    curl -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
      -d "<story><current_state>unstarted</current_state></story>" \
      http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje2.id}
    ENDOFCURL
    system(systemstring)
  end
end

