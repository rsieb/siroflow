#!/usr/bin/env ruby -KU
# encoding: UTF-8

require 'rubygems'
require '/Users/rs/rt/Terminal.rb'
require '/Users/rs/rt/Log.rb'
require '/Users/rs/rt/Activity.rb'
require '/Users/rs/rt/Pomodoro.rb'
require 'Logger'
require 'active_support/core_ext/numeric/time'
LOCKFILE = '/tmp/chaseidle.lock'
LOGGER = Logger.new(STDERR)
LOGGER.level = Logger::DEBUG
LOGFILE = '/tmp/routinetracker.log'
LOGGER.debug "LOGFILE = #{LOGFILE}"

if ( File.exists?(LOCKFILE) && File.mtime(LOCKFILE) > 60.seconds.ago )
  LOGGER.warn 'ChaseIdle already active. Abort.'
else # this means if the file does not exist OR if the mtime is more than 60 seconds ago
  File.write(LOCKFILE, '')

  if IO.readlines(LOGFILE).first.match('PREZMODE').to_s.size == 0
    LOGGER.debug 'PREZMODE not active'
    module RoutineTracker
      # Making sure this script somehow inherits from Activity. God so ugly.
      class Main < Activity
        LOGGER.debug "actual = #{actual}"
        if idle?(actual)
          LOGGER.debug 'idle = true'
          LOGGER.info 'Chaseup'
          LOGGER.debug "targetfile = #{targetfile}"
          Terminal.chaseup(targetfile)
        else
          LOGGER.debug 'idle = false'
          LOGGER.info 'Remind'
          LOGGER.debug "reminding of  = #{actual}"
          Terminal.remind(actual)
        end
      end
    end
  end

  File.delete(LOCKFILE)
end
