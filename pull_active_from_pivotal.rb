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
  @mystate = ["started","delivered","finished","rejected","unestimated","unstarted"]
else
  @mystate = ["started","rejected","unstarted"]
end


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
  # begin
  #   mijntaak = "NO TASK"
  #   verhaaltje.tasks.all.each do |taakje|
  #     if !taakje.complete and mijntaak == "NO TASK"
  #       mijntaak = taakje.description
  #     end
  #   end
  # rescue
  #   mijntaak   = "NO TASK"
  # end
  begin
    mijnetiket = verhaaltje.labels
  rescue
    mijnetiket = "NO LABEL"
  end
  if eigenaar=="Roland Siebelink" then
    #    puts "#{mijnstatus[0].upcase}/#{mijnnaam}>>#{mijntaak} +#{mijnetiket}"
    puts "#{mijnstatus[0].upcase} #{mijnnaam} +#{mijnetiket}"
  else
    puts "#{mijnstatus[0].upcase} #{mijnnaam} +#{mijnetiket} (#{initials(eigenaar)})"
  end
end
