property redtask : "Usable enterprise deck"
property tddgoal : "+1cll"
property pomodori : 6

tell application "System Events" to set the visible of every process to false
activate
display dialog �
	"What is your reddest MBO task?" default answer redtask �
	with icon 1 �
	buttons {"Cancel", "OK"} �
	default button "OK"
-- if OK
set myresult to result
set button_pressed to button returned of myresult
set redtask to text returned of myresult

display dialog �
	"What is the Toodledo Goal for " & redtask & "? " & return & "[start with +]" default answer tddgoal �
	with icon 1 �
	buttons {"Cancel", "OK"} �
	default button "OK"
-- if OK
set myresult to result
set button_pressed to button returned of myresult
set tddgoal to text returned of myresult

display dialog �
	"How many Pomodori do you want to add?" default answer pomodori �
	with icon 1 �
	buttons {"Cancel", "OK"} �
	default button "OK"
-- if OK
set myresult to result
set button_pressed to button returned of myresult
set pomodori to text returned of myresult

repeat with i from 0 to (pomodori - 1)
	set emailinput to ((redtask & " " & (pomodori - i) as string) & "/" & pomodori as string) & " " & tddgoal & " * $Next Action"
	log emailinput
	set myOutput to do shell script "echo '" & emailinput & "' | mail rs69todos.157623@toodledo.com 2>&1 "
	display dialog emailinput & return & "=>" & return & myOutput buttons {"�"} giving up after 1
end repeat

--set today to do shell script ("date '+%Y-%m-%d 09:30'") as date
tell application "iCal"
	set mysummary to redtask & " " & tddgoal
	set mynewevent to (make new event with properties {start date:current date, allday event:true, summary:mysummary} at end of events of calendar "Work")
	activate
	show mynewevent
end tell
