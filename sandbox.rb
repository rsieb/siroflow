#!/usr/bin/env ruby

require 'rubygems'
require 'appscript'
require 'osax'
require '_routine_methods'

doel = 1837 # seconden
# rare omweg om met Time te kunnen werken
#  t = Time.gm(2000,"jan",1,20,15,1)   #=> Sat Jan 01 20:15:01 UTC 2000
puts doel, doel.to_human, doel.to_minuteur
# include Appscript
#  app("Minuteur").StartCountdown("001000")
