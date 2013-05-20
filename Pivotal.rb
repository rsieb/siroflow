#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

class Pivotal

  def initialize
    PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token
  end

  def projects
    [780227,781813,786005]
  end

  def addtasks
    if ARGV[0] == "--all" then
      @mystate = ["started","finished","rejected","unestimated","unstarted"]
    else
      @mystate = ["started","rejected","unestimated"]
    end



    @mystories = Array.new()

    @myprojects = [780227,781813,786005] # ,479975
    @myprojects.each do |projectnummer|
      @a_project = PivotalTracker::Project.find(projectnummer)
      @mystories = @mystories + @a_project.stories.all(:state => @mystate, :owned_by => "Roland Siebelink")
    end

    @mystories.each do |verhaaltje|
      mijntaak = "!NoTask"
      verhaaltje.tasks.all(:complete => false).each do |taakje|
        #puts ">>" + verhaaltje.name + " " + taakje.description
        if !taakje.complete and mijntaak == "!NoTask"
          mijntaak = taakje.description
        end
        #puts verhaaltje.name + " " + mijntaak
      end
      #pp mijntaak
      if (mijntaak == "!NoTask" || !verhaaltje.labels)
        #p "****** Launching URL... *****"
        system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
      end
    end
  end

  def nitins
    @mystories = Array.new
    self.projects.each do |projectnummer|
      @a_project = PivotalTracker::Project.find(projectnummer)
      @mystories = @mystories + @a_project.stories.all(:owned_by => "Nitin Gupta")
      @mystories
    end
  end
end


p = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')
#p = Pivotal.new
#pp p.nitins
@mystories = Array.new
@myprojects = [780227,781813,786005]
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all(:owned_by => "Nitin Gupta")
  @mystories.each {|verhaaltje| puts verhaaltje.name}
end
