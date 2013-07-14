#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'

@mytoken = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token


## get the name of the Pomodoro
@pomodoro_name = ARGV[0]
## skip for routines
if @pomodoro_name.include?("+rout") then
  puts "Routine task. Aborted."
  abort
end

# TODO 2013-04-30 Catch Beeminder routines to open corresponding goal in Beeminder for updating

if @pomodoro_name.include?("+beem") then
  myslug = @pomodoro_name[/\w+ \+beem/][/\w+/] # user to put slug as last word before +beem code
  puts "Beeminder task. Opening URL with slug `#{myslug}'"
  myurl = "http://beeminder.com/cyberroland/goals/#{myslug}"
  system("/usr/bin/osascript -e 'open location  \"#{myurl}\" ' ")
  abort
end

@mystories = Array.new

## Cycle through projects
@myprojects = [781813] # ,780227,,786005] #,787023] # ,479975
@myprojects.each do |projectnummer|
  # some spring cleaning needed first!
  # TODO 2013-05-22 why don't we make the mess below into a proper regex :)
  @basepomname = @pomodoro_name.sub("√","").sub(/>>.*/,"")
  #@nametocheck = @basepomname[0]+@basepomname[2..-1]
  $nametocheck = @basepomname[2..-1] # does not need to capture the priority level, is immaterial
  $taskdescrtocheck = @pomodoro_name.sub(/.*>>/,"").sub(/ \+/,"")
  ###puts projectnummer

  @a_project = PivotalTracker::Project.find(projectnummer)
  ## -- find the story with this title
  @allstories = @a_project.stories.all()
  @allstories.each do |verhaaltje|
    if verhaaltje.name.include?($nametocheck) || $nametocheck.include?(verhaaltje.name) then
      @mystories.push(verhaaltje)
      ###puts "Adding #{verhaaltje.id} to @mystories"
    end # if include
  end # stories cycle
end # projects cycle

## -- found? yes then
if @mystories.size > 0 then
  #pp "Found one"
  ## I don't really want to create automated comments!
  @mystories.each do |verhaaltje|

    # DONE 2013-07-05 automatically finish current task in pivotal
    counter = 0
    verhaaltje.tasks.all().select{|t| t.complete == false}.each do |taak|
      pp taak
      pp taak.description
      pp $nametocheck
      counter = counter + 1
      if taak.description.include?($taskdescrtocheck) || $taskdescrtocheck.include?(taak.description) then
        counter = counter - 1
        systemstring = <<-ENDOFCURL3
        curl -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
          -d "<task><complete>true</complete></task>" \
          http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}/tasks/#{taak.id}
        ENDOFCURL3
        system(systemstring)
      end

      # switch active Pivotal story to finished (or "started?" check in practice)
      if counter > 0 # that means there are still open tasks
        storystatus = "started"
      else
        storystatus = "finished"
      end

      systemstring = <<-ENDOFCURL
      curl -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
        -d "<story><current_state>#{storystatus}</current_state></story>" \
        http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}
      ENDOFCURL
      system(systemstring)

      # then add a note with a time and date stamp when I actually worked on this
      systemstring = <<-ENDOFCURL2
      curl -H "X-TrackerToken: #{@mytoken}" -X POST -H "Content-type: application/xml" \
        -d "<note><text>#{Time.now.strftime("%Y-%m-%d %H:%M")}</text></note>" \
        http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}/notes
      ENDOFCURL2
      system(systemstring)

    end

    #puts conte.name + " " + conte.current_state

    ## Just open the found story in the UI
    # DONE 2013-07-14 this may not be needed anymore?
    #system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
  end
  ## -- if not found then
  #else
  #   pp "Did not find one"
  #   ## -- set the default project
  # # @defaultproject = PivotalTracker::Project.find(786005)  # this is the "management" project
  #   @defaultproject = PivotalTracker::Project.find(787023)  # this is the "inbox" project
  #   ## ---- create a new story in the default project
  #   @mynewstory = @defaultproject.stories.create(:name => @nametocheck, :story_type => 'bug')
  #   pp @mynewstory
  #   ## Just open the found story in the UI
  #     system("/usr/bin/osascript -e 'open location  \"" + @mynewstory.url + "\" ' ")
  #   ## -- end
end
