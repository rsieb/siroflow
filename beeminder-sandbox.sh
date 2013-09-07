#!/bin/bash
source '/Users/rs/.bash_include_rs'

/usr/bin/env ruby <<-EORUBY

require '/Users/rs/rt/Beeminder.rb'
b = RoutineTracker::Minder.new(SECRETCODE)

getver = %w/kilos homemeals afd runkeeper lean dagboek lifthabits chapter theeconomist atlantic newyorker callfamily prioritize stories groceries administration declutter laundry/

getver.each do |sluck|
	b.archivenbb(sluck)
end


EORUBY