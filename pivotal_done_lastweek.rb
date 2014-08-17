# encoding: utf-8

#!/usr/bin/env ruby -KU

require 'bundler/setup'
# require 'rubygems'
# require 'active_resource'
# require 'pp'
require 'chronic'
require 'pivotal-tracker'

@mystate = ["accepted"]
@since = Chronic::parse("yesterday").strftime("%Y-%m-%d")
puts "#{@since}--#{Time.now.strftime("%Y-%m-%d")}"

PivotalTracker::Client.token('roland@rocketfuelinc.com', 'qub0y?Qatar')        # Automatically fetch API Token

@mystories = Array.new()

@myprojects = [781813]

@myprojects.each do |projectnummer|
  #pp projectnummer
  @a_project = PivotalTracker::Project.find(projectnummer)
  @mystories = @a_project.stories.all(:state => @mystate, :accepted_on => @since, :includedone => :true )
  #pp @mystories.class
  @mystories.each do |verhaaltje|
    #pp verhaaltje
    # etiketjes = verhaaltje.labels
    # if !etiketjes
    #   etiketjes = "NA"
    # end

    # puts etiketjes.upcase + ": " + verhaaltje.name.upcase
    puts "* #{verhaaltje.name}"
     verhaaltje.tasks.all(:complete => true).each do |taakje|
      puts "    - " + taakje.description
    end
  end
end
