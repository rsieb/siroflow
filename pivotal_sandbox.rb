#!/usr/bin/env ruby -KU

require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'
require 'chronic'
require 'logger' ; LOGGER=Logger.new(STDOUT)
LOGGER.level = ( ENV['LOGLEVEL'] || LOGGER.level = Logger::WARN )

@mystate = ["started","unstarted","finished","unscheduled"]

@mytoken = PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token
LOGGER.debug "#{@mytoken}"

@mystories = Array.new()

@myprojects = [781813] # take out FUEL 780227,786005,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  LOGGER.info "Project ##{projectnummer} = #{@a_project.name}"

  #@mystories = @mystories + @a_project.stories.all(:current_state => @mystate)
  @mystories = @mystories + @a_project.stories.all(:includedone => false,:current_state => @mystate)
  LOGGER.info ":excludedone => #{@mystories.size} stories found"
  LOGGER.debug "#{@mystories.inspect}"
end

@emptylabels = @mystories.select{|verhaaltje| verhaaltje.labels == nil}
LOGGER.info "#{@emptylabels.size} issues found without label"
LOGGER.debug "#{@emptylabels.inspect}"
# TODO 2013-11-12 the below will fail if a single story has more than one label. Catch this.

if @emptylabels.size > 0
  @emptylabels.each{|verhaaltje|

    LOGGER.debug "verhaaltje = #{verhaaltje.inspect}"
  puts "#{verhaaltje.name} +NOLABEL"}
else
  @switchlabel = ""
  @mystories.sort_by{|verhaaltje| verhaaltje.labels}.each{|conte|

    LOGGER.debug "#{@switchlabel} =? #{conte.labels}"

    if ( @switchlabel != conte.labels)
      @switchlabel = conte.labels
      puts "\n+#{@switchlabel.upcase}"
    end

    LOGGER.debug "#{}"
    LOGGER.debug "conte = #{conte.inspect}"
    puts "#{conte.name}"
  }
end