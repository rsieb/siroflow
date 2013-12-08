task :beeminder_update do

  require '/Users/rs/rt/Beeminder.rb'
# TESTCODE
b = RoutineTracker::Minder.new(SECRETCODE)
b.update
  

