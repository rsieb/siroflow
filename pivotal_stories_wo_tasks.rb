#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

if ARGV[0] == "--all" then
  @mystate = ["started","finished","rejected","unestimated","unstarted"]
else
  @mystate = ["started","rejected","unestimated"]
end


PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [780227,781813,786005] # ,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all(:state => @mystate, :owned_by => "Roland Siebelink")
end

@mystories.each do |verhaaltje|
  begin
    mijntaak = "!NoTask"
    verhaaltje.tasks.all.each do |taakje|
      if !taakje.complete and mijntaak == "!NoTask"
        mijntaak = taakje.description
      end
    end
  rescue
    mijntaak = "!NoTask"
  end
  if mijntaak == "!NoTask" then
    system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
  end
end
