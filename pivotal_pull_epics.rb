# encoding: utf-8

#!/usr/bin/env ruby -KU

require 'bundler/setup'
# require 'rubygems'
# require 'active_resource'
# require 'pp'
# require 'chronic'
require 'pivotal-tracker'



PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [781813] # take out FUEL 780227,786005,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @mystories + @a_project.stories.all()
  #pp @mystories
end

myepics = Array.new

@mystories.each do |verhaaltje|
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
      #if etiketje[0] =~ /[0-9]/
        # this is an epic label
        myepics.push(etiketje)
      #end
    end
  rescue
  end
end

epicstring = ""
myepics.uniq.sort.each do |epique|
  epicstring = epicstring + epique + "\n"
end
puts epicstring
