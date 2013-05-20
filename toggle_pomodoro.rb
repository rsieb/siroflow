#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require '/Users/rs/rt/Terminal.rb'
require '/Users/rs/rt/Log.rb'
require '/Users/rs/rt/Activity.rb'
require '/Users/rs/rt/Pomodoro.rb'

  module RoutineTracker
    class Main < Activity
        if idle?(actual) 
        	# then prompt for pomodoro
          puts "Chaseup"
          Terminal.chaseup(target)      
        else
        	# then force_completion
          puts "Remind"
          Terminal.remind(actual)
        end
    end
  end