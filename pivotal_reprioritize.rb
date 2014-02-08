#!/usr/bin/env ruby -KU
  
require 'rubygems'
require 'active_resource'
require 'pp'
require 'pivotal-tracker'
require 'chronic'
require 'logger'
LOGGER = Logger.new(STDOUT)
LOGGER.level = (ENV['LOGLEVEL'] || LOGGER.level = Logger::WARN)

@mystate = %w( started unstarted finished unscheduled)

# Automatically fetch API Token
@mytoken = PivotalTracker::Client.token(
  'roland@rocketfuelinc.com',
  'qub0y?Qatar')
LOGGER.debug "#{@mytoken}"

@mystories = Array[]

@myprojects = [781_813] # take out FUEL 780227,786005,479975
@myprojects.each do |projectnummer|
  @a_project = PivotalTracker::Project.find(projectnummer)
  LOGGER.info "Project ##{projectnummer} = #{@a_project.name}"

  @mystories = @mystories + @a_project.stories.all(
    includedone: false,
    current_state: @mystate
  )
  LOGGER.info ":excludedone => #{@mystories.size} stories found"
  LOGGER.debug "#{@mystories.inspect}"
end

@emptylabels = @mystories.select { |verhaaltje| verhaaltje.labels.nil? }
LOGGER.info "#{@emptylabels.size} issues found without label"
LOGGER.debug "#{@emptylabels.inspect}"
# TODO: 2013-11-12 the below will fail if single story has more than
# one label. Catch this.

if @emptylabels.size > 0
  @emptylabels.each do |verhaaltje|

    LOGGER.debug "verhaaltje = #{verhaaltje.inspect}"
    puts "#{verhaaltje.name} +NOLABEL"
  end
else
  @switchlabel = ''
  @mystories.sort_by { |verhaaltje| verhaaltje.labels }.each do |conte|

    LOGGER.debug "#{@switchlabel} =? #{conte.labels}"

    #comparing previous label to current
    if @switchlabel != conte.labels[0..3]
      # reset to current
      @switchlabel = conte.labels[0..3]
      # and print a separator
      puts "\n+#{@switchlabel.upcase}"
    end

    LOGGER.debug "#{}"
    LOGGER.debug "conte = #{conte.inspect}"
    puts "#{conte.name}"
  end
end
