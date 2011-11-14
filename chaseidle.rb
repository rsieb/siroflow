#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require 'appscript'
#require_relative '_routine_methods'
require '/Users/rs/rt/Terminal.rb'
require '/Users/rs/rt/Log.rb'
require '/Users/rs/rt/Activity.rb'
#require_relative 'Pomodoro'

module RoutineTracker

  class Main < Activity
    if idle?(actual) 
      Terminal.chaseup(target)
    else
      Terminal.remind(actual)
    end
  end

end