#!/usr/bin/env ruby -KU
# encoding: UTF-8

require 'rubygems'
require '/Users/rs/rt/Terminal.rb'
require '/Users/rs/rt/Log.rb'
require '/Users/rs/rt/Activity.rb'
require '/Users/rs/rt/Pomodoro.rb'
require 'Logger'
#require 'active_support/core_ext/numeric/time'


LOCKFILE = '/tmp/chaseidle.lock'
LOGGER = Logger.new(STDOUT)
#LOGGER = Logger.new('/Users/rs/Library/Logs/chaseidle_rb.log')
LOGGER.level = Logger::DEBUG
LOGFILE = '/tmp/routinetracker.log'
LOGGER.debug "LOGFILE = #{LOGFILE}"

if File.exists?(LOCKFILE) && File.mtime(LOCKFILE) > (Time.now - 60)
  LOGGER.warn 'ChaseIdle already active. Abort.'
else # ie, if file does not exist OR if mtime is more than 60 seconds ago
  File.write(LOCKFILE, '')

  if IO.readlines(LOGFILE).first.match('PREZMODE').to_s.size == 0 || File.mtime(LOGFILE) < (Time.now - 90*60)
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
        elsif break?(actual)
          LOGGER.debug 'break = true'
          #LOGGER.info 'ScreenSaver'
          #system("/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine")
        elsif longprezmode?(actual)
          LOGGER.debug 'longprezmode'
          system %q(osascript -e 'display alert "This computer has been running in presentation mode for over 1.5 hours."')
        else ## not idle nor break
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
