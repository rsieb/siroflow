# encoding: utf-8
#!/usr/bin/env ruby -KU

require 'rubygems'
require 'bundler/setup'
require 'pp'
require 'pivotal-tracker'

@mytoken = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

## get the name of the Pomodoro
@pomodoro_name = ARGV[0]

story_type = ''

## skip for routines 2013-08-18 also skip for short improvised pomodori
if @pomodoro_name.include?("+rout") then
  puts "Routine task."
  story_type = 'chore'
  abort
end

if !@pomodoro_name.include?("+") then
  puts "Considered a bug."
  story_type = 'bug'
  abort
end

if @pomodoro_name.include?("+jira") then
  puts "Pulled this from JIRA."
  myslug = @pomodoro_name[/QI-\d*/] # user to put slug as last word before +beem code
  myurl = "https://rocketfuel.jira.com/browse/#{myslug}"
  system(" /usr/bin/osascript -e 'open location  \"#{myurl}\" ' ")
  story_type = 'bug'
end

if @pomodoro_name.include?("h00") or @pomodoro_name.include?("h30")  or @pomodoro_name.include?("h15")  or @pomodoro_name.include?("h45") then
  puts "Meeting."
  story_type = 'chore'
  abort
end

# TODO 2013-04-30 Catch Beeminder routines to open corresponding goal in Beeminder for updating

if @pomodoro_name.include?("+beem") then
  myslug = @pomodoro_name[/\w+ \+beem/][/\w+/] # user to put slug as last word before +beem code
  puts "Beeminder task. Opening URL with slug `#{myslug}'"
  myurl = "http://beeminder.com/cyberroland/goals/#{myslug}"
  system("cd /Users/rs/rt ; /usr/bin/osascript -e 'open location  \"#{myurl}\" ' ")
  story_type = 'chore'
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
  #$nametocheck = @basepomname[2..-1] # does not need to capture the priority level, is immaterial
  $nametocheck = @basepomname.sub(/ \+/,"") # deleting the above while I am testing doing without status and priority
  $taskdescrtocheck = @pomodoro_name.sub(/.*>>/,"").sub(/ \+/,"")
  ###puts projectnummer

  @a_project = PivotalTracker::Project.find(projectnummer)
  ## -- find the story with this title
  @mystate = %w( started finished rejected unstarted )
  @allstories = @a_project.stories.all(:state => @mystate, :includedone => :true)
  @allstories.each do |verhaaltje|
    puts "Found: #{verhaaltje.name}"
    if verhaaltje.name.include?($nametocheck) || $nametocheck.include?(verhaaltje.name) then
      @mystories.push(verhaaltje)
      puts "Adding #{verhaaltje.id} to @mystories"
    end # if include
    # also set number of points to number of (sub)tasks, but use 1 when no subtasks
    mypoints = [verhaaltje.tasks.all.size,1].max
    puts "Story should be #{mypoints} points"
    systemstring = <<-ENDOFCURLPOINTS
    curl --silent -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
      -d "<story><estimate>#{mypoints}</estimate></story>" \
      http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}
    ENDOFCURLPOINTS
    #puts "\n\n#{systemstring}\n"
    system(systemstring + ' > /dev/null')
  end # stories cycle
end # projects cycle

## -- found? yes then
if @mystories.size > 0 then
  pp "Found #{@mystories.size} matching stories"
  ## I don't really want to create automated comments!
  @mystories.each do |verhaaltje|
    pp verhaaltje

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
        curl --silent -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
          -d "<task><complete>true</complete></task>" \
          http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}/tasks/#{taak.id}
        ENDOFCURL3
        #puts "\n\n#{systemstring}\n"
    system(systemstring + ' > /dev/null')
      end
    end

    # move just finished story to the back of the queue
    if counter > 0 # that means there are still open tasks
      unless verhaaltje.labels.include? ">burst"
        storystatus = "started"
        @laststoryid=@a_project.stories.all(:current_state => "started").last().id
        if !@laststoryid then
          @laststoryid=@a_project.stories.all(:current_state => "delivered").last().id
        end
        systemstring = <<-ENDOFCURL4
        curl --silent -H "X-TrackerToken: #{@mytoken}" -X POST \
          "http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}/moves?move\\[move\\]=after&move\\[target\\]=#{@laststoryid}" -d ""
        ENDOFCURL4
        #puts "\n\n#{systemstring}\n"
        # DON'T ACTUALLY MOVE IT
        #system(systemstring + ' > /dev/null')

      end
    else
      storystatus = "finished"
    end

    # Always switch owner to Roland
    systemstring = <<-ENDOFCURL
    curl --silent -H "X-TrackerToken: #{@mytoken}" -X PUT -H "Content-type: application/xml" \
      -d "<story><current_state>#{storystatus}</current_state><owned_by>Roland Siebelink</owned_by></story>" \
      http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}
    ENDOFCURL
    puts "\n\n#{systemstring}\n"
    system(systemstring + ' > /dev/null')

    # then add a note with a time and date stamp when I actually worked on this
    systemstring = <<-ENDOFCURL2
    curl --silent -H "X-TrackerToken: #{@mytoken}" -X POST -H "Content-type: application/xml" \
      -d "<note><text>#{Time.now.strftime("%Y-%m-%d %H:%M")}</text></note>" \
      http://www.pivotaltracker.com/services/v3/projects/#{@a_project.id}/stories/#{verhaaltje.id}/notes
    ENDOFCURL2
    puts "\n\n#{systemstring}\n"
    system(systemstring + ' > /dev/null')

    #puts conte.name + " " + conte.current_state

    ## Just open the found story in the UI
    # DONE 2013-07-14 this may not be needed anymore?
    #system("/usr/bin/osascript -e 'open location  \"" + verhaaltje.url + "\" ' ")
  end
  ## -- if not found then
else
  puts "Did not find a matching story for [#$nametocheck]"

  ## -- set the default project
  @defaultproject = PivotalTracker::Project.find(781813)
  ## ---- create a new story in the default project

  @mynewstory = @defaultproject.stories.create(:name => $nametocheck, :story_type => story_type, :labels => 'w'+Time.now.strftime("%V")+'s', :current_state => 'accepted')
  pp @mynewstory
  ## Just open the found story in the UI
  #system("/usr/bin/osascript -e 'open location  \"" + @mynewstory.url + "\" ' ")
  ## -- end
end
