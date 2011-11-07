#!/usr/bin/env ruby

require 'rubygems'
require 'appscript' 



# doel = 1837 # seconden
# # rare omweg om met Time te kunnen werken
# #  t = Time.gm(2000,"jan",1,20,15,1)   #=> Sat Jan 01 20:15:01 UTC 2000
# puts doel, doel.to_human, doel.to_minuteur
# # include Appscript
# #  app("Minuteur").StartCountdown("001000")

iterm = Appscript::app("iTerm")
myterminal =iterm.terminals[1]
mysession = myterminal.make(:new => :session, :with_properties => {:name => "progress"})
mysession.exec(:command => "/bin/bash")
mysession.write(:text => "cd /Users/rs/Dropbox/Library/Scripts/Routinetracker/ ; /usr/bin/env ruby progress.rb 'make tea' 120")