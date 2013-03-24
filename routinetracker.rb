#!/usr/bin/env ruby -U
# encoding: UTF-8

require 'rubygems'
require 'yaml'
require 'appscript' ; include Appscript
# #require 'osax' ; include OSAX
require 'readline'
require 'active_support/core_ext/integer/inflections'
require_relative 'Terminal'
#ψ Most small routines in separate file
require './_routine_methods'
# This line is causing errors af
#require_relative 'routrack/config/application'


module RoutineTracker

  class Main

    #@runroutine = Routine.run(ARGV[0])

    # capture command line arguments: routine and task 
    if ARGV[0]
      @laadbestand = ARGV[0]
    else
      @laadbestand = "yamls/fast_test.routine.yaml"
    end
    if ARGV[1]
      @overalltask = ARGV[1]
    else
      @overalltask = nil
    end


    @terminal = RoutineTracker::Terminal.instance
    @terminal.welcome("RoutineTracker")

    bbeeggiinnttiijjdd = Time.now()

    # Now we can load the file
    @terminal.debug "Loading #{@laadbestand}..."
    @tasks = YAML.load_file( @laadbestand )
    @aantal = @tasks.size

    # # add Drink task if non existent
    # if @tasks[0].keys != ["Have a drink"]
    #   @tasks.unshift({"Have a drink"=>[60.0]})
    # end

    # remove Drink task at start of routine
    if @tasks[0].keys == ["Have a drink"]
      @tasks.delete_at(0)
    end

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
        # puts naam.inspect
        # puts waarden.inspect
        # TODO 2010-08-29_2057-0700 replace single values in YAML with hash structure containing dates and status and notes, use OmniOutliner to model first
        # seconds already done at the beginning of each task equals total seconds from previous loop
        @afgerond[nummer] = @totaalseconden
        # add the new number of seconds to generate a new total
        # TODO 2012-06-04 catch cases where all values are zero, this causes an error because 0 is not valid
        #@totaalseconden = @totaalseconden + waarden.valid_stats.median
        @nieuweseconden = waarden.valid_stats.mean
        if @nieuweseconden == 99999 then
          @terminal.warn "Skipped #{naam} too often -- deleting"
          @parking = YAML.load_file( "yamls/parking.routine.yaml" )
          @parking.unshift(Hash["#{@laadbestand.gsub(".routine.yaml","").gsub("yamls/","")}: #{naam}" => waarden])
          File.open("yamls/parking.routine.yaml", 'w')  do |out|
            YAML.dump( @parking, out )
          end # File.open

          @tasks.delete_at(nummer)
        else
          @totaalseconden = @totaalseconden + @nieuweseconden
        end
      end
    end

    @terminal.info "Planning #{@totaalseconden.to_human} until finish"
    if @totaalseconden > 27.5 * 60 then
      # TODO 2012-06-29 change hard-coded exits to user-chosen course of action
      @terminal.error("ERROR: Too much for a Pomodoro. Please reduce.")
      app("Sublime Text 2").open MacTypes::Alias.path(@laadbestand)
      app('Sublime Text 2').activate
      exit
    elsif @totaalseconden < 22.5 * 60 then
      @terminal.warn("WARNING: Too little for a Pomodoro. Can increase.")
    end

    mytask = @laadbestand.gsub(".routine.yaml","").gsub("yamls/","")

    #ψ Get data from external file - moved this from earlier in script
    @active = Hash.new()
    @active = YAML.load_file( "yamls/_bezig.yaml" )
    @totaalbezig = @active[Time.now.strftime("%Y-%m-%d")] || @totaalbezig = 0

    taaknummer = ((@totaalbezig/86400).to_i + 1).to_s.rjust(2,'0') + " "
    @totaalminuten = (@totaalseconden/60 + 0.5 ).to_i + 1

    @bezig = 0

    # ======================
    # = Loop through tasks =
    # ======================
    @tasks.each do |taak|
      @teller = @tasks.index(taak)
      taak.each do |naam,waarden|
        #ψ ] Read title, target, set counter
        if ( @overalltask && naam == "^")
          activiteit = @overalltask
        else
          activiteit = naam
        end
        puts activiteit
        # TODO 20100726_0931 move target calculation to beginning of code, keeping only real results in database?
        @doel = waarden.valid_stats.mean * 0.99 # just a tiny speed up factor
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
          #@terminal.notify "\e[H\e[2J\n"
          #ψ ]] Recalculate end time
          nogverwacht = @totaalseconden - @afgerond[@teller]
          starttijd = Time.now()
          @doeltijd = starttijd + @doel
          endtime = starttijd + nogverwacht
          lowtgttime = @doeltijd - @afwijking
          hightgttime = @doeltijd + @afwijking
          # TODO 20100802_1324 put all these calcs in log file for easy comparison

          #ψ ]] Say title, counter against target
          #      @terminal.info "From #{starttijd.strftime("%H:%M")} to #{endtime.strftime("%H:%M")}?"
          @terminal.debug "#{activiteit} #{starttijd.strftime("%H:%M:%S")} Projecting routine finish by #{endtime.strftime("%H:%M:%S")}\n"
          @terminal.warn "Done by #{endtime.strftime('%H:%M')}"
          # DONE 20100727_1121 20100726_0934 announce seconds as human-understandable minutes and seconds
          if @bezig.to_i > 0
            @terminal.info "Total #{(100*@verschil/@doel).to_i} percent off"
          end
          @terminal.info("\n\n#{activiteit.upcase} (#{@teller+1}/#{@aantal+1})")
          #       FIXED 2010-08-21_1841-0700 let the target minutes be said by Minuteur :)
          @terminal.debug "#{@doel.to_human}
          (#{(@doel - @afwijking).to_human} to #{(@doel + @afwijking).to_human})."

          # ===================
          # = Start the clock =
          # ===================
          # NICETOHAVE 2010-08-21_1409-0700 add "leisurely" or "aggressive" option to set target differently based on mood of user. Or based on average performance so far?

          File.open("/tmp/routinetracker.log", 'w+')  do |f|
            #          f.write("#{activiteit}, " + lowtgttime.strftime("%H:%M") +  + "   \t\n")
            f.write("#{activiteit} by #{@doeltijd.strftime("%H:%M")} #rout")
          end
          iterm = Appscript::app("iTerm")
          oldterminal = iterm.terminals[1]
          myterminal = iterm.make(:new => :terminal)
          mysession = myterminal.make(:new => :session, :with_properties => {:name => "progress session"})
          mysession.exec(:command => "/bin/bash")
          mysession.write(:text => "cd /Users/rs/Dropbox/Library/Scripts/Routinetracker/ ; /usr/bin/env ruby progress.rb '#{activiteit}' #{@doel}")
          #oldterminal.activate # disturbs when already moving to a different screen to complete the activity

          #         app("TimeBoxed").reset
          #         app("TimeBoxed").timer_duration.set(@doel)
          # #        app("TimeBoxed").activate
          #         app("TimeBoxed").start
          #         # moving iTunes to after Minuteur to avoid the 10 second delay
          # begin
          #   iTunes.next_track
          #   iTunes.play
          # rescue
          #   @terminal.warn("Some problem with iTunes")
          # end
          # # app("iCal").run
          # # icallog = @myevent.description.get.to_s
          # # if icallog == "missing_value" then
          # #   icallog = "Routinetracker.rb (c)2010-2011 by Roland Siebelink"
          # # end
          # # icalentry = "\n#{Time.now.strftime("%x %X")} #{activiteit} #{@doel.to_human}"
          # @myevent.description.set(icallog + icalentry)
          # @myevent.end_date.set(endtime+3600)
          #@terminal.debug "Starting #{starttijd.strftime("%H:%M:%S")}, finish between #{lowtgttime.strftime("%H:%M:%S")} and #{hightgttime.strftime("%H:%M:%S")}"


          #ψ ]] Wait for user input
          statusinput = Readline.readline('[f]inished [s]kip [r]estart [e]xception e[x]it? ',true)
          #        app("Minuteur").quit
          # TODO 2010-08-20_1401-0700  Add "Go back one step" option
          # TODO 20100802_1325 Add "Combine with previous" option
          # TODO 20100725_1010 Add Pause option
          status = statusinput[0..0]
          @gedaan = Time.now()

          #ψ ]] Process user input

          begin
            mysession.terminate
          rescue
            # probably already closed
          end
          @breekmij = nil
          case status
          when "s"
            @eindtijd = 0

          when "x"
            # TODO 2010-08-21_1434-0700 move this to a try - rescue - ensure statement
            # File.open("/tmp/routinetracker.log", 'w+')  do |f|
            #   f.write("RoutineTracker IDLE  \t\n")
            # end

            # eeiinnddttiidd = Time.now() - bbeeggiinnttiijjdd
            # @totaalbezig = @totaalbezig + eeiinnddttiidd + (3600 * 24)
            # @active[Time.now.strftime("%Y-%m-%d")] = @totaalbezig
            # @terminal.warn "Already tracked #{(@totaalbezig).to_human} today. Congratulations!"
            # @myevent.end_date.set(Time.now())
            # File.open("_bezig.yaml", 'w+')  do |out|
            #   YAML.dump( @active, out )
            # end
            @breekmij = true
            #          @eindtijd = (@gedaan - starttijd)
            @eindtijd = 0
            # @terminal.info("#{@eindtijd.to_human}")
            # @terminal.debug "#{@gedaan.strftime("%H:%M:%S")}\nTargeted #{@doel.to_human} (#{(@doel - @afwijking).to_human} to #{(@doel + @afwijking).to_human})\nFinished #{@eindtijd.to_human} "

            # TODO 2010-08-21_1434-0700 should just go back to main menu, not leave program
            @laadbestand = nil
            #exit

          when "r"
            @gedaan = nil
            starttijd = Time.now()
            @doeltijd = starttijd + @doel
            @terminal.info "Restarted"

          when "e"
            @eindtijd = (starttijd - @gedaan)
            @terminal.warn("Exception")

          else
            @eindtijd = (@gedaan - starttijd)

            @terminal.info("#{@eindtijd.to_human}")
            @terminal.debug "#{@gedaan.strftime("%H:%M:%S")}\nTargeted #{@doel.to_human} (#{(@doel - @afwijking).to_human} to #{(@doel + @afwijking).to_human})\nFinished #{@eindtijd.to_human} "

            #ψ Evaluate result and give user feedback
            # unless the task was canceled or marked as an exception

            # DONE 20100731_1916  20100726_0930 base score calculation on STDEVs, mins and maxs
            # TODO 2010-08-28_1202-0700 this is such a mess, move to logging all and then letting view decide what to display
            @verschil = @doel - @eindtijd
            # DOC now score based on reported deviation versus standard dev:
            # DOC if within standard deviation then good, if not then either very good or very bad
            if @verschil < 0  then
              score = -(@verschil/@afwijking) 
              teken = "sexy"
            else
              score = (@verschil/@afwijking)
              teken = "wild"
            end
            # if @verschil.to_i > 0 then
            #   # @terminal.warn "#{(100*@verschil/@doel).to_i} percent off"
            # end
            @bezig = @bezig + @eindtijd
            # end
            File.open("/Users/rs/rt/routinesontime.log", 'a')  do |resultaat|

              case score.truncate #returns float truncated to an Integer
                # TODO 20100808_1100 change these evaluations to overall routine scores, not specific per task
              when 0
                # within one standard dev
                @terminal.warn("On target, famously successful!")
                resultaat.write("•")
              when 1
                # more than one standard dev
                @terminal.warn( "A bit #{teken}, successful!")
                resultaat.write(teken[0].downcase)
              else
                # more than two standard devs
                @terminal.warn("#{teken} but you are taking care!") 
                resultaat.write(teken[0].upcase)
              end     
            end

            # # TOP X Scoring
            # plaatsteller = 1
            # waarden.sort!.each do |referentie|
            #   if @eindtijd > referentie
            #     plaatsteller = plaatsteller + 1
            #     referentie = referentie.to_i
            #   else
            #     break
            #   end # if @eindtijd > referentie
            # end # waarden.each
            # case plaatsteller
            # when 1
            #   oordeel = "Woohoo! You won "
            # when 2
            #   oordeel = "Excellent, you got the"
            # when 3
            #   oordeel = "Good, "
            # when 4..5
            #   oordeel = "Not bad, "
            # else
            #   oordeel = "Concentrate! Only "
            # end # case plaatsteller
            # @terminal.warn "#{oordeel} #{plaatsteller.ordinalize} place."

          end # case status
        end #ψ End while user not finished


        #ψ ] Store real end time
        #        if @eindtijd != 0
        waarden.unshift(@eindtijd).sort!
        # leave time to build up some extra values, otherwise outliers are immediately chopped off
        # TODO 2010-08-29_2050-0700 check if it still makes sense to delete values, switching off for now
        wgrootte = waarden.size
        mingrootte = 4
        if wgrootte > (3 * mingrootte)
          # # cut half of difference to the front
          # waarden.shift((wgrootte-mingrootte)/2)
          # # and cut half of difference to the back
          # waarden.pop((wgrootte-mingrootte)/2)
          # cut one outlier value to the front and one to the back
          waarden.shift(1) ; waarden.pop(1)

        end # if wgrootte >
        #        end # if @eindtijd !=0
        # DONE 20100725_0828 reproject end time 20100726_1229
        #ψ Store data for next time
        # DONE 20100802_1327 - save values on every loop
        if ( @tasks != nil && @laadbestand != nil )
          File.open( @laadbestand, 'w' ) do |out|
            YAML.dump( @tasks, out )
          end # File.open
        end
        # File.open("/tmp/routinetracker.log", 'w+')  do |f|
        #   f.write("RoutineTracker IDLE")
        # end # File.open
      end #ψ taak.each
      # TODO 20100725_0828 report total score
      if @breekmij then
        @breekmij = false
        exit
      end
    end

    @terminal.info "\n\n"
    eeiinnddttiidd = Time.now() - bbeeggiinnttiijjdd
    @terminal.warn "#{@laadbestand.gsub(".routine.yaml"," routine").gsub("yamls/","")} done in #{eeiinnddttiidd.to_human}."
    # @terminal.debug "Total #{@bezig.to_human} or #{(@bezig/(@bezig + eeiinnddttiidd)*100).to_i} percent off!"
    # @myevent.end_date.set(Time.now()+1)
    # @myevent.summary.set(@myevent.summary.get + (eeiinnddttiidd/60).to_i.to_s)
    @totaalbezig = @totaalbezig + eeiinnddttiidd + (3600 * 24)
    @active[Time.now.strftime("%Y-%m-%d")] = @totaalbezig
    @terminal.info "Already tracked #{(@totaalbezig).to_human} today. Congratulations!"
    File.open("/tmp/routinetracker.log", 'w+')  do |f|
      f.write("#BREAK#")
    end
    app("Sublime Text 2").open MacTypes::Alias.path(@laadbestand)
    app('Sublime Text 2').activate
    File.open("yamls/_bezig.yaml", 'w+')  do |out|
      YAML.dump( @active, out )
    end # File.open
    begin
      app("Pomodoro").force_completion
      app("iTerm").quit
    rescue Exception => e
      @terminal.error " #{e.message}\n\n#{e.backtrace.inspect}"
    end
    #    app('iCal').activate

    @laadbestand = nil

  end
end








