#!/bin/bash

/usr/bin/env ruby <<-EORUBY

require '/Users/rs/rt/Beeminder.rb'
# TESTCODE
b = RoutineTracker::Minder.new(SECRETCODE)
b.update


EORUBY