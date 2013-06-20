#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

def initials(naam)
  initialen = ""
  naam.split.each {|woord|
    initialen = initialen + woord[0]
  }
  initialen
end
@mystate = ["started","rejected"]

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [780227,781813,786005] # take out FUEL ,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all(:state => @mystate)
end

@mystories.each do |verhaaltje|
  begin
    mijnstatus = verhaaltje.current_state
    if mijnstatus == "started"
      mijnstatus = "ztarted" # come on top in reverse sort
    end
  rescue
    mijnstatus = "NO STATUS"
  end
  begin
    mijnnaam   = verhaaltje.name
  rescue
    mijnnaam   = "NO STORY"
  end
  if mijnnaam == nil then
    mijnnaam = "NO STORY"
  end
  eigenaar = verhaaltje.owned_by
  if eigenaar == nil then
    verhaaltje.owned_by = "Roland Siebelink"
    eigenaar = "Roland Siebelink"
  end
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
  # solving bug where previously started and now unscheduled stories still come out when querying "unstarted"
  unless mijnstatus == "unscheduled"
    if mijntaak == "NO TASK"
      system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
    end
    puts "#{mijnnaam[0]}#{mijnstatus[0].upcase}#{mijnnaam[1..-1]}>>#{mijntaak} +#{mijnetiket} "
  end
end
