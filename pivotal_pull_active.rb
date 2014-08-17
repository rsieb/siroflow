# encoding: utf-8

#!/usr/bin/env ruby -KU

require 'bundler/setup'
# require 'rubygems'
# require 'active_resource'
# require 'pp'
# require 'chronic'
require 'pivotal-tracker'

def initials(naam)
  initialen = ""
  naam.split.each {|woord|
    initialen = initialen + woord[0]
  }
  initialen
end
@mystate = %w( started rejected )

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [781813] # take out FUEL 780227,786005,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all(:state => @mystate)
  #pp @mystories
end

# if @mystories.size < 5
#   require './pivotal_finished_reset.rb'
#   @myprojects.each do |projectnummer|
#   @a_project = PivotalTracker::Project.find(projectnummer)
#   @mystories = @mystories + @a_project.stories.all(:state => @mystate)
#   #pp @mystories
# end

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
    mijnetiket = Array(verhaaltje.labels.split(","))
  rescue
    mijnetiket = Array("NO LABEL")
  end
  #puts "Mijnetiket = #{mijnetiket}"
  mijnprioriteit=""
  begin
    mijnetiket.each do |etiketje|
      #puts "etiketje = #{etiketje}"
      if etiketje[0] == "π"
        # this is a priority label
        mijnprioriteit = etiketje[1]
        mijnetiket.delete[etiketje]
        return
      else
        mijnprioriteit = " "
      end
    end
  rescue
  end

  # # solving bug where previously started and now unscheduled stories still come out when querying "unstarted"
  # unless mijnstatus == "unscheduled"
  if mijntaak == "NO TASK"
    #puts "#{mijnprioriteit}#{mijnstatus[0].upcase}-#{mijnnaam} +#{mijnetiket.first}"
    puts "#{mijnnaam} \##{verhaaltje.id} +#{mijnetiket.first}"
    system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
  else
    #   #puts "#{mijnnaam[0]}#{mijnstatus[0].upcase}#{mijnnaam[1..-1]}>>#{mijntaak} +#{mijnetiket} "
    #puts "#{mijnprioriteit}#{mijnstatus[0].upcase}-#{mijnnaam}>>#{mijntaak} +#{mijnetiket.first}"
    puts "#{mijnnaam} \##{verhaaltje.id}>>#{mijntaak}  +#{mijnetiket.first}"
  end
end
