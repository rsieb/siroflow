(*
Routine script
*)

-- pseudo> initialise
property scriptname : "Default Script"
activate
-- pseudo> ask user to confirm start
display dialog "Do you want to start the the routine for " & scriptname & "?" buttons {"Cancel","Start now"} default button 2 giving up after 60
say "starting " & scriptname
-- pseudo> read tasks (name, duration)
-- pseudo> open file for writing if results updated every time
-- pseudo> loop through tasks
-- pseudo>   calculate status (time passed vs planned)
-- pseudo>   notify name + status + overtime if any
-- pseudo>   ask user if done or continuing
-- pseudo>     wait for one minute default is continuing
-- pseudo>   after reply received
-- pseudo>   if continuing then
-- pseudo>     go back to calculating status
-- pseudo>   if done then
-- pseudo>     note down result: real time passed
-- pseudo>     adapt plan for next time?
-- pseudo>   end if
-- pseudo>   go to next task
-- pseudo> end loop 
-- pseudo> housekeeping
