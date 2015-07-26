#!/bin/bash

echo "Bash_include"
source '/Users/rs/.rbenv_include.sh'

cd /Users/rs/rt
#beemind -t UUTnFgjX2FyEyC3GX2zW lifthabits `/usr/bin/env ruby /Users/rs/rt/Lift.rb` "Auto-added `date` from launchagents/beeminder- autoupdates.sh"
#echo "Written"
bash /Users/rs/Dropbox/Writing/written.sh
#echo "Dagboek"
#/Users/rs/.rbenv/shims/beemind -t UUTnFgjX2FyEyC3GX2zW dagboek `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -print | wc -l` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
#beemind -t UUTnFgjX2FyEyC3GX2zW it `cat /Users/rs/rt/interruptions.log | wc -l` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW wklessons `ruby wanikani-reviews.rb` "Auto-added `date` from launchagents /beeminder-autoupdates.sh" &
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW newkanji `ruby wanikani-lessons.rb` "Auto-added `date` from launchagents /beeminder-autoupdates.sh" &
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW kanji `ruby wanikani-progress-for-beeminder.rb` "Auto-added `date` from launchagents /beeminder-autoupdates.sh" &
# werkt niet, geen authenticatie /Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW jdays `ruby jira_avgdayssincemod.rb` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW deo `ruby -e "puts (Time.now - Time.new(2015,7,8,15,48,07))/86400"` "Auto-added `date` from launchagents /beeminder-autoupdates.sh" &
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW bwo `ruby -e "puts (Time.now - File.mtime('/Users/rs/Dropbox/Elements/WorkoutTracker.txt'))/3600"` "Auto-added `date` from launchagents /beeminder-autoupdates.sh" &
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW hsincewk `ruby -e "puts (Time.now - File.mtime('/Users/rs/Dropbox/8vw2015/Wanikani/Wanikani Stats Tracking 2015-04-26.xlsx'))/3600"` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
#echo "HHW Diary entries"
#beemind -t UUTnFgjX2FyEyC3GX2zW hhw `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -newer /Users/rs/rt/beeminder_dagboek.log -print | wc -l` "Diary entries auto-added from beeminder-autoupdates.sh"
echo "Update last file"
#ruby /Users/rs/rt/pivotal_accepted.rb
#touch /Users/rs/rt/beeminder_dagboek.log

