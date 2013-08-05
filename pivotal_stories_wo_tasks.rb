#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

# if ARGV[0] == "--all" then
  @mystate = ["started","finished","rejected","unestimated","unstarted","unscheduled"]
# else
#   @mystate = ["started","rejected","unestimated"]
# end


@mytoken = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [781813] # ,479975,786005,780227,
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  #@mystories = @mystories + @a_project.stories.all(:state => @mystate, :owned_by => "Roland Siebelink")
  @mystories = @mystories + @a_project.stories.all(:state => @mystate)
end

@mystories.each do |verhaaltje|
  # systemstring = <<-ENDOFCURL
  # curl -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
  #   -d "<story><owned_by>Roland Siebelink</owned_by></story>" \
  #   http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}
  # ENDOFCURL
  # system(systemstring)


  mijntaak = "!NoTask"
  verhaaltje.tasks.all(:complete => false).each do |taakje|
    #puts ">>" + verhaaltje.name + " " + taakje.description
    if !taakje.complete and mijntaak == "!NoTask"
      mijntaak = taakje.description
    end
    #puts verhaaltje.name + " " + mijntaak
  end
  #pp mijntaak
  if (mijntaak == "!NoTask")
    #p "****** Launching URL... *****"
  systemstring = <<-ENDOFCURL
     curl -H "X-TrackerToken: #{@mytoken}" -X POST -H "Content-type: application/xml" \
    -d "<task><description>Workflowy</description></task>" \
    http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}/tasks
  ENDOFCURL
  system(systemstring)

  
    #system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
  end
end
