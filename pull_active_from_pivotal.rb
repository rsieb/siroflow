#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

def initials(stringetje)
  lengte = (stringetje.size - 2)
  return stringetje[0]+lengte.to_s+stringetje[-1]
end

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
  @mystories = @mystories + @a_project.stories.all(:state => @mystate)
end

@mystories.each do |verhaaltje|
  #pp verhaaltje
  begin
    mijnnaam   = verhaaltje.name
  rescue
    mijnnaam   = "NO STORY"
  end
  if mijnnaam == nil then
    mijnnaam = "NO STORY"
  end
  begin
    eigenaar   = verhaaltje.owned_by
  rescue
    eigenaar   = "NO OWNER"
  end
  if eigenaar == nil then
    eigenaar = "NO OWNER"
  end
  #pp eigenaar
  begin
    mijntaak = "NO TASK"
    verhaaltje.tasks.all.each do |taakje|
      if !taakje.complete and mijntaak == "NO TASK"
        mijntaak = taakje.description
      end
    end
  rescue
    mijntaak   = "NO TASK"
  end
  begin
    mijnetiket = verhaaltje.labels
  rescue
    mijnetiket = "NO LABEL"
  end
  if eigenaar=="Roland Siebelink" then 
  	puts "#{mijnnaam}>>#{mijntaak} +#{mijnetiket}"
  else
    puts "•#{initials(eigenaar)} #{mijnnaam} +#{mijnetiket}"
  end
end
