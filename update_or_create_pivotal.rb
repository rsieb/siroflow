#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token


## get the name of the Pomodoro
@pomodoro_name = "Test Pomodoro for Pivotal integration"

:story_found = false

## Cycle through projects
@myprojects = [780227,781813,786005] # ,479975
@myprojects.each do |projectnummer|
	@a_project = PivotalTracker::Project.find(projectnummer) 
	## -- find the story with this title
	@a_story = @a_project.stories.first(:name => @pomodoro_name)
	## -- found? yes then
	if @a_story then
		## ---- add a comment
		puts @a_story.name
		## ---- track that it was found
		:story_found = true
	## -- end if
	end
	## end cycle
end

## -- if not found then
if :story_found==false then
## -- set default project
## ---- create a new story in the default project
## -- end
