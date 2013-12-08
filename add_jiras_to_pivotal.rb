#!/usr/bin/env ruby -wKU

require 'json'
require './jira_classes.rb'
require 'pp'
#require 'pivotal-tracker'


jql= %q[assignee=roland and (status != closed OR resolution is empty)]

resulting = Jiraah::Issue.search(jql)

#@defaultproject = PivotalTracker::Project.find(781813)  # this is the "roland private" project

resulting.each do |j|
    ## ---- create a new story in the default project
#   @mynewstory = @defaultproject.stories.create(:name => @nametocheck, :story_type => 'bug')
   pp j.summary

end

# quack = {:timestamp => Time.now.strftime("%s").to_i , :value => result}
# @output = RobbieDash::Ducksboard.post(DUCKSBOARD_API,quack.to_json)
# puts @output
