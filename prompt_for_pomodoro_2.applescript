on minimizeAll()
	tell application "System Events"
		set theButtons to {}
		
		repeat with theApplication in application processes
			if the name of theApplication ­ "FluidApp" then
				repeat with theWindow in windows of theApplication
					repeat with theButton in buttons of theWindow
						if ((description of theButton) is "minimize button") then
							set theButtons to theButtons & {theButton}
						end if
					end repeat
				end repeat
			end if
		end repeat
		
		repeat with theButton in theButtons
			click theButton
		end repeat
		
		--do it twice because it usually misses one the first time
		repeat with theButton in theButtons
			click theButton
		end repeat
		(*
		activate
		display dialog "Are all windows mimimized?" buttons {"No", "Yes"} default button 1 giving up after 10
		if the button returned of the result is "No" then
			set the visible of every process to false
		end if
		*)
	end tell
	
end minimizeAll

to WriteLog(text4Log)
	do shell script "echo `date '+%Y-%m-%d %H:%M:%s'` " & quoted form of text4Log & ">>" & "/Users/rs/Library/Logs/com.rolandsiebelink.pomodoro.log"
	tell application id "com.Growl.GrowlHelperApp" to notify with name "Info" title text4Log description text4Log application name "PomodoroGlue" priority -2 --set to 0 to see these success notifications
end WriteLog

to WriteError(text4Log)
	do shell script "echo `date '+%Y-%m-%d %H:%M:%s` " & quoted form of text4Log & ">>" & "/Users/rs/Library/Logs/com.rolandsiebelink.pomodoro.log"
	tell application id "com.Growl.GrowlHelperApp" to notify with name "Error" title text4Log description text4Log application name "PomodoroGlue" priority 1
end WriteError

property tracknumber : 1

on run argv
	set myresult to do shell script "grep -q \"IDLE\" /tmp/routinetracker.log" -- should cancel the script if IDLE is not in the file
	
	tell application id "com.Growl.GrowlHelperApp"
		register as application "PomodoroGlue" all notifications {"Info", "Error"} default notifications {"Info", "Error"} icon of application "Pomodoro.app"
	end tell
	
	-- #############################################
	set thisroutine to "Increase sound volume"
	try
		if (get (output muted of (get volume settings))) is false then
			set volume output volume ((output volume of (get volume settings)) + 1) -- should not choke on setting it above 100, tested
		end if
		WriteLog("Success: " & thisroutine)
	on error errStr number errorNumber
		WriteError("Error: " & thisroutine & " " & errStr & " (" & errorNumber & ")")
	end try
	
	-- #############################################
	set thisroutine to "Hide all apps"
	try
		my minimizeAll()
		WriteLog("Success: " & thisroutine)
	on error errStr number errorNumber
		WriteError("Error: " & thisroutine & " " & errStr & " (" & errorNumber & ")")
	end try
	-- #############################################
	
	set thisroutine to "Play a random track and mark it as played"
	try
		set mytimestamp to current date
		set tracknumber to ((item 1 of argv as number) + 1) -- catch argument being zero
		--tell application "Adium" to activate
		with timeout of 5 seconds
			tell application "iTunes"
				try
					set someTrack to track tracknumber of (the first playlist whose name is "JapanesePod101")
				on error
					-- pick the Studio Brussel audio stream
					set someTrack to (the first track whose name contains ("Studio Brussel | kwaliteit"))
				end try
				ignoring application responses
					try
						set played date of someTrack to mytimestamp
						set skipped date of someTrack to mytimestamp
						play someTrack
					on error
						say "bad iTunes"
					end try
				end ignoring
			end tell
		end timeout
		WriteLog("Success: " & thisroutine)
	on error errStr number errorNumber
		WriteError("Error: " & thisroutine & " " & errStr & " (" & errorNumber & ")")
	end try
	
	
	
	-- #############################################
	set thisroutine to "Read the tasks"
	try
		tell application "System Events"
			set mytasks to do shell script "/bin/cat -s /Users/rs/Dropbox/Elements/Todyn.txt"
			
			set mytoptask to the first paragraph of mytasks
			say mytoptask
		end tell
		WriteLog("Success: " & thisroutine)
	on error errStr number errorNumber
		WriteError("Error: " & thisroutine & " " & errStr & " (" & errorNumber & ")")
	end try
	
	
	-- #############################################
	set thisroutine to "Prompt for Pomodoro"
	try
		-- should not do this one, only causes confusion
		--tell application "Terminal" to do shell script "cd /Users/rs/rt ; /Users/rs/rt/auto_update_todyn.sh & "
		
		tell application "System Events"
			set newtimestamp to current date
			set mydiff to newtimestamp - mytimestamp
			set parent_process to (do shell script "ps -ocommand= -p $PPID | awk -F/ '{print $NF}' | awk '{print}'")
			my minimizeAll
			activate
			display dialog "Spend next Pomodoro on?" with title parent_process & " (" & mydiff & " sec delay)" buttons {"Cancel", "Start"} default answer mytasks default button 1 giving up after 59
		end tell
		if the button returned of the result is "Start" then
			set myfulltask to the first paragraph of text returned of the result
			set ods to AppleScript's text item delimiters
			set AppleScript's text item delimiters to "`"
			set mytask to the first text item of myfulltask
			try
				set myduration to the second text item of myfulltask as number
			on error
				set myduration to 25
			end try
			set AppleScript's text item delimiters to ods
			try
				set breakminutes to do shell script "cat /tmp/pomodorodone.log" as string
			on error
				set breakminutes to "5"
			end try
			set breakminutes to breakminutes as integer
			if breakminutes < 5 then set breakminutes to 5
			if breakminutes > 15 then set breakminutes to 15
			if myduration = 1 then set breakminutes to 1
			tell application "Pomodoro"
				-- start mytask duration myduration break breakminutes
				-- ignoring calculation for breakminutes
				start mytask duration myduration
			end tell
			(*
			if PomodoroName contains "+rout" then
				tell application "Beeminder" to open location "https://www.beeminder.com/cyberroland/goals/effrout"
			end if
			*)
			tell application "iTunes" to stop
		end if
		WriteLog("Success: " & thisroutine)
	on error errStr number errorNumber
		WriteError("Error: " & thisroutine & " " & errStr & " (" & errorNumber & ")")
	end try
	
end run
