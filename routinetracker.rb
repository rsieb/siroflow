#!/usr/bin/env ruby

#ψ Set up libraries and data definitions


require 'rubygems'
require 'yaml'
require 'appscript'
require 'osax'
require 'readline'
include Appscript


iTunes = Appscript.app("iTunes")

# Store the state of the terminal
stty_save = `stty -g`.chomp
# Allow for user cancellations without generating an exception
trap('INT') { system('stty', stty_save); exit }

#ψ Most small routines in separate file
require '_routine_methods'

#ψ Get data from external file
@active = Hash.new()
@active = YAML.load_file( "_bezig.yaml" )
@totaalbezig = @active[Time.now.strftime("%Y-%m-%d")] || @totaalbezig = 0

#ψ Clear screen and welcome user
print "\e[H\e[2J"
puts "\nWelcome to RoutineTracker!\n"
say "Welcome!"

if ARGV[0] then
  @laadbestand = ARGV[0]
end

# FIXED 2010-08-21_1346-0700 adding endless loop
while true == true # endless loop until interrupted
  unless @laadbestand
    puts "\nLooking for files ending in .routine.yaml ...\n"
    #ψ All routines available are stored in the same directory and ending in *.routine.yaml
    @keuze = Dir.glob("*.routine.yaml")
    #ψ Show the possible routines to the user
    @keuze.each_index do |number|
      # TODO 2010-08-20_1432-0700 replace this with printing nicely in columns
      # either just space them out halfway on the screen or print an array
      # as two columns as discussed on http://railsforum.com/viewtopic.php?id=15716
      # correcting for counting from 1 to reserve 0 value for strings and cancellatons
      print "[#{(number+1).to_s(36)}] #{@keuze[number].gsub(".routine.yaml","")}  "
    end
    print " or e[X]uit"
    # Ask the user for his choice
    mijnkeuze = Readline.readline('> ', true)
    if mijnkeuze == "X" then
      exit 0
    end if
    # Take the first character of the choice and ensure it is an integer
    doen = mijnkeuze[0..0].to_i(36) - 1
    # This determines the file to load
    @laadbestand = @keuze[doen]
    # Test if the file exists - error and exit if not
  end
  unless (  defined?(@laadbestand) && @laadbestand != nil )
    puts "Your choice was not valid. Exiting..."
    exit 1
  end

  bbeeggiinnttiijjdd = Time.now()
  # Now we can load the file
  puts "Loading #{@laadbestand}..."
  @tasks = YAML.load_file( @laadbestand )
  @aantal = @tasks.size

  #ψ Calculate totals
  # initialize empty value for total number of seconds
  @totaalseconden = 0
  # initialize empty array for total seconds of finished tasks
  @afgerond = Array.new()
  # loop through tasks
  @tasks.each_index do |nummer|
    # doc: taak.class = Hash ; taak.inspect ="Sit down"=>[5, 8, 3]}
    # this is an array of hashes, now we need to loop through the hash itself
    @tasks[nummer].each do |naam,waarden|
      # TODO 2010-08-29_2057-0700 replace single values in YAML with hash structure containing dates and status and notes, use OmniOutliner to model first
      # seconds already done at the beginning of each task equals total seconds from previous loop
      @afgerond[nummer] = @totaalseconden
      # add the new number of seconds to generate a new total
      @totaalseconden = @totaalseconden + waarden.valid_stats.median
    end
  end

  taaknummer = ((@totaalbezig/86400).to_i + 1).to_s.rjust(2,'0') + " "
  app("iCal").windows[1].switch_view(:to => :week_view)
  say "#{@laadbestand.gsub(".routine.yaml","")}"
  @myevent = app("iCal").make(
  :at => app.calendars[its.name.eq("Tracker")].calendars[1].events.end,
  :new => :event,
  :with_properties => {
    :start_date => Time.now(),
    :end_date => Time.now() + @totaalseconden,
    :summary => "#{taaknummer}#{@laadbestand.gsub(".routine.yaml","")} #{(@totaalseconden/60).to_i}/"
  }
  )
  app("iCal").activate
  @myevent.show
  @bezig = 0

  # ======================
  # = Loop through tasks =
  # ======================
  @tasks.each do |taak|
    @teller = @tasks.index(taak)
    taak.each do |naam,waarden|
      #ψ ] Read title, target, set counter
      activiteit = naam
      # TODO 20100726_0931 move target calculation to beginning of code, keeping only real results in database?
      @doel = waarden.valid_stats.mean * 0.95 # try to speed up a bit man!
      # DONE 20100802_1327 Calculate stdev rather than average

      # now calculate the standard deviation
      @afwijking = waarden.valid_stats.stdev_notzero
      # if ( @afwijking == nil || @afwijking == 0 ) then
      #   @afwijking = 1
      # end

      @gedaan = nil
      # =======================
      # = Task Restart loop =
      # =======================
      while @gedaan == nil
        print "\e[H\e[2J"
        system("/usr/bin/osascript /Users/rs/Dropbox/Library/Scripts/Focus.scpt")
        begin
          iTunes.next_track
          iTunes.play
        rescue
          puts("Some problem with iTunes")
        end
        puts ""
        #puts "\n\n * * * \n\n"
        #ψ ]] Recalculate end time
        nogverwacht = @totaalseconden - @afgerond[@teller]
        starttijd = Time.now()
        @doeltijd = starttijd + @doel
        endtime = starttijd + nogverwacht
        lowtgttime = @doeltijd - @afwijking
        hightgttime = @doeltijd + @afwijking
        # TODO 20100802_1324 put all these calcs in log file for easy comparison

        #ψ ]] Say title, counter against target
        #      say "From #{starttijd.strftime("%H:%M")} to #{endtime.strftime("%H:%M")}?"
        puts "#{starttijd.strftime("%H:%M:%S")} Projecting routine finish by #{endtime.strftime("%H:%M:%S")}\n"
        # DONE 20100727_1121 20100726_0934 announce seconds as human-understandable minutes and seconds
        if @bezig.to_i > 0
          puts "Total #{(100*@verschil/@doel).to_i} percent off"
        end
        say("#{activiteit}")
        puts("\n\n#{activiteit.upcase} (#{@teller+1}/#{@aantal+1})")
        #       FIXED 2010-08-21_1841-0700 let the target minutes be said by Minuteur :)
        #       say("#{@doel.to_human}")
        puts "#{@doel.to_human}
        (#{(@doel - @afwijking).to_human} to #{(@doel + @afwijking).to_human})."
        #ψ ]] Start the clock
        # NICETOHAVE 2010-08-21_1409-0700 add "leisurely" or "aggressive" option to set target differently based on mood of user. Or based on average performance so far?
        #app("Minuteur").activate
        app("Minuteur").StartCountdown((@doel).to_minuteur)
        #app("Minuteur").StartCountdown((@doel+@afwijking).to_minuteur)
        File.open("/tmp/routinetracker.log", 'w+')  do |f|
          #          f.write("#{activiteit}, " + lowtgttime.strftime("%H:%M") +  + "   \t\n")
          f.write("#{activiteit} <" + @doeltijd.strftime("%H:%M") + "–" + hightgttime.strftime("%H:%M"))
        end
        app("iCal").run
        icallog = @myevent.description.get.to_s
        if icallog == "missing_value" then
          icallog = "Routinetracker.rb ©2010 by Roland Siebelink"
        end
        icalentry = "\n#{Time.now.strftime("%x %X")} #{activiteit} #{@doel.to_human}"
        @myevent.description.set(icallog + icalentry)
        @myevent.end_date.set(endtime+3600)

        #puts "Starting #{starttijd.strftime("%H:%M:%S")}, finish between #{lowtgttime.strftime("%H:%M:%S")} and #{hightgttime.strftime("%H:%M:%S")}"


        #ψ ]] Wait for user input
        statusinput = Readline.readline('[f]inished [s]kip [r]estart [e]xception e[x]it? ',true)
        app("Minuteur").quit
        # TODO 2010-08-20_1401-0700  Add "Go back one step" option
        # TODO 20100802_1325 Add "Combine with previous" option
        # TODO 20100725_1010 Add Pause option
        status = statusinput[0..0]
        @gedaan = Time.now()

        #ψ ]] Process user input
        case status
        when "s"
          @eindtijd = 0

        when "x"
          # TODO 2010-08-21_1434-0700 move this to a try - rescue - ensure statement
          File.open("/tmp/routinetracker.log", 'w+')  do |f|
            f.write("RoutineTracker IDLE  \t\n")
          end
          eeiinnddttiidd = Time.now() - bbeeggiinnttiijjdd
          @totaalbezig = @totaalbezig + eeiinnddttiidd + (3600 * 24)
          @active[Time.now.strftime("%Y-%m-%d")] = @totaalbezig
          shout "Already tracked #{(@totaalbezig).to_human} today. Congratulations!"
          @myevent.end_date.set(Time.now())
          File.open("_bezig.yaml", 'w+')  do |out|
            YAML.dump( @active, out )
          end

          # TODO 2010-08-21_1434-0700 should just go back to main menu, not leave program
          exit

        when "r"
          @gedaan = nil
          starttijd = Time.now()
          @doeltijd = starttijd + @doel
          say "Restarted"

        when "e"
          @eindtijd = (starttijd - @gedaan)
          shout("Exception")

        else
          @eindtijd = (@gedaan - starttijd)

          say("#{@eindtijd.to_human}")
          puts "#{@gedaan.strftime("%H:%M:%S")}\nTargeted #{@doel.to_human} (#{(@doel - @afwijking).to_human} to #{(@doel + @afwijking).to_human})\nFinished #{@eindtijd.to_human} "

          #ψ Evaluate result and give user feedback
          # unless the task was canceled or marked as an exception

          # DONE 20100731_1916  20100726_0930 base score calculation on STDEVs, mins and maxs
          # TODO 2010-08-28_1202-0700 this is such a mess, move to logging all and then letting view decide what to display
          @verschil = @doel - @eindtijd
          if @verschil < 0  then
            score = -(@verschil/@afwijking)
            teken = "slow"
            detailscore = ((10.0 *score).round)/10.0
            # shout "#{detailscore.to_s} #{teken}"
            case score.to_i
              # TODO 20100808_1100 change these evaluations to overall routine scores, not specific per task
            when 0
              puts "On track, #{teken}"
            when 1
              puts "A bit #{teken}"
            else
              puts "Too #{teken}"
            end     
          else
            if @verschil.to_i > 0 then
              # shout "#{(100*@verschil/@doel).to_i} percent off"
            end
            @bezig = @bezig + @eindtijd
          end


        end
        # TODO 20100802_1328 Ask user for notes at end of task
        openapps = app("System Events").processes.get
        openapps.each do |programma|
          begin
            case programma.name.get
            when "Finder"
              programma.visible.set(true)
            else
              programma.visible.set(false)
            end
          rescue
            # don't do anything
          end
        end

      end #ψ End while user not finished


      #ψ ] Store real end time
      if @eindtijd != 0
        waarden.unshift(@eindtijd).sort!
        # leave time to build up some extra values, otherwise outliers are immediately chopped off
        # TODO 2010-08-29_2050-0700 check if it still makes sense to delete values, switching off for now
        wgrootte = waarden.size
        mingrootte = 5
        if wgrootte > (3 * mingrootte)
          # cut half of difference to the front
          waarden.shift((wgrootte-mingrootte)/2)
          # and cut half of difference to the back
          waarden.pop((wgrootte-mingrootte)/2)
        end
      end # if @eindtijd
      # DONE 20100725_0828 reproject end time 20100726_1229
      #ψ Store data for next time
      # DONE 20100802_1327 - save values on every loop
      File.open( @laadbestand, 'w' ) do |out|
        YAML.dump( @tasks, out )
      end
      File.open("/tmp/routinetracker.log", 'w+')  do |f|
        f.write("RoutineTracker IDLE")
      end
    end #ψ End loop through defined task
    # TODO 20100725_0828 report total score
  end
  print "\n\n"
  eeiinnddttiidd = Time.now() - bbeeggiinnttiijjdd
  shout "#{@laadbestand.gsub(".routine.yaml"," routine")} done in #{eeiinnddttiidd.to_human}."
  # puts "Total #{@bezig.to_human} or #{(@bezig/(@bezig + eeiinnddttiidd)*100).to_i} percent off!"
  @myevent.end_date.set(Time.now()+1)
  @myevent.summary.set(@myevent.summary.get + (eeiinnddttiidd/60).to_i.to_s)
  @totaalbezig = @totaalbezig + eeiinnddttiidd + (3600 * 24)
  @active[Time.now.strftime("%Y-%m-%d")] = @totaalbezig
  shout "Already tracked #{(@totaalbezig).to_human} today. Congratulations!"
  File.open("_bezig.yaml", 'w+')  do |out|
    YAML.dump( @active, out )
  end
  #app("TextMate").open MacTypes::Alias.path(@laadbestand)
  #app('TextMate').activate
  #    app('iCal').activate

  @laadbestand = nil
end
