#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require 'appscript'
#require_relative '_routine_methods'
require_relative 'Terminal'
require_relative 'Log'
require_relative 'Activity'
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