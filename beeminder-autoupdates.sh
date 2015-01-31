#!/bin/bash

echo "Bash_include"
source '/Users/rs/.rbenv_include.sh'

cd /Users/rs/rt
#beemind -t UUTnFgjX2FyEyC3GX2zW lifthabits `/usr/bin/env ruby /Users/rs/rt/Lift.rb` "Auto-added `date` from launchagents/beeminder- autoupdates.sh"
#echo "Written"
#bash /Users/rs/Dropbox/Writing/written.sh
echo "Dagboek"
/Users/rs/.rbenv/shims/beemind -t UUTnFgjX2FyEyC3GX2zW dagboek `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -print | wc -l` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
#beemind -t UUTnFgjX2FyEyC3GX2zW it `cat /Users/rs/rt/interruptions.log | wc -l` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW wklessons `ruby wanikani-lessons.rb` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
/Users/rs/.rbenv/shims/beemind -t  UUTnFgjX2FyEyC3GX2zW kanji `ruby wanikani-progress-for-beeminder.rb` "Auto-added `date` from launchagents /beeminder-autoupdates.sh"
#echo "HHW Diary entries"
#beemind -t UUTnFgjX2FyEyC3GX2zW hhw `find /Users/rs/Dropbox/Apps/Day\ One/Journal.dayone -type f -newer /Users/rs/rt/beeminder_dagboek.log -print | wc -l` "Diary entries auto-added from beeminder-autoupdates.sh"
echo "Update last file"
ruby /Users/rs/rt/pivotal_accepted.rb
touch /Users/rs/rt/beeminder_dagboek.log

