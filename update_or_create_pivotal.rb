#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token


## get the name of the Pomodoro
@pomodoro_name = ARGV[0]
## skip for routines
if @pomodoro_name.include?("+rout") then
	puts "Routine task. Aborted."
	abort
end

if @pomodoro_name.include?("+beem") then
	myslug = @pomodoro_name.split[1] # second word from array
	puts "Beeminder task. Opening URL with slug `#{myslug}'"
	myurl = "http://beeminder.com/cyberroland/goals/#{myslug}"
	system("/usr/bin/osascript -e 'open location  \"#{myurl}\" ' ") 
	abort
end

# TODO 2013-04-30 Catch Beeminder routines to open corresponding goal in Beeminder for updating

@mystories = Array.new

## Cycle through projects
@myprojects = [781813] # ,780227,,786005] #,787023] # ,479975
@myprojects.each do |projectnummer|
	@basepomname = @pomodoro_name.sub("√","")
	@nametocheck = @basepomname[0]+@basepomname[2..-1]
	###puts projectnummer

	@a_project = PivotalTracker::Project.find(projectnummer) 
	## -- find the story with this title
	@allstories = @a_project.stories.all()
	@allstories.each do |verhaaltje|
		if verhaaltje.name.include?(@basepomname) || @basepomname.include?(verhaaltje.name) then
			@mystories.push(verhaaltje)
			###puts "Adding #{verhaaltje.id} to @mystories"
		end # if include
	end # stories cycle	
end # projects cycle

## -- found? yes then
if @mystories.size > 0 then
	pp "Found one"
	## I don't really want to create automated comments!
	@mystories.each do |verhaaltje|
		## Just open the found story in the UI
		system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
	end
## -- if not found then
else
	pp "Did not find one"
	## -- set the default project
#	@defaultproject = PivotalTracker::Project.find(786005)  # this is the "management" project
	@defaultproject = PivotalTracker::Project.find(787023)  # this is the "inbox" project
	## ---- create a new story in the default project
	@mynewstory = @defaultproject.stories.create(:name => @nametocheck, :story_type => 'bug')
	pp @mynewstory
	## Just open the found story in the UI
		system("/usr/bin/osascript -e 'open location  \"" + @mynewstory.url + "\" ' ")
	## -- end
end