#!/usr/bin/env ruby

#ψ Set up libraries and data definitions


require 'yaml'

require 'readline'
# Store the state of the terminal
stty_save = `stty -g`.chomp
# Allow for user cancellations without generating an exception
trap('INT') { system('stty', stty_save); exit }

#ψ Most small routines in separate file
require '_routine_methods'

#ψ Get data from external file

#ψ Clear screen and welcome user
print "\e[H\e[2J"
puts "\nWelcome to RoutineTracker!\n"
say "Welcome!"
puts "\nLooking for files ending in .routine.yaml ...\n"
#ψ All routines available are stored in the same directory and ending in *.routine.yaml
@keuze = Dir.glob("*.routine.yaml")
#ψ Show the possible routines to the user
@keuze.each_index do |number|
  # correcting for counting from 1 to reserve 0 value for strings and cancellatons
  puts "[#{number+1}] #{@keuze[number]}"
end
# Ask the user for his choice
mijnkeuze = Readline.readline('> ', true)
# Take the first character of the choice and ensure it is an integer
doen = mijnkeuze[0..0].to_i
# This determines the file to load
@laadbestand = @keuze[doen-1]
# Test if the file exists - error and exit if not
unless (  defined?(@laadbestand) && @laadbestand != nil )
  puts "Your choice was not valid. Exiting."
  exit 1
end

# Now we can load the file
puts "Loading #{@laadbestand}..."
@tasks = YAML.load_file( @laadbestand )

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
    # seconds already done at the beginning of each task equals total seconds from previous loop
    @afgerond[nummer] = @totaalseconden
    # add the new number of seconds to generate a new total
    @totaalseconden = @totaalseconden + waarden.valid_stats.median
  end
end

# ======================
# = Loop through tasks =
# ======================
@tasks.each do |taak|
  @teller = @tasks.index(taak)
  taak.each do |naam,waarden|
    #ψ ] Read title, target, set counter
    activiteit = naam
    # TODO 20100726_0931 move target calculation to beginning of code, keeping only real results in database?
    @doel = waarden.valid_stats.mean
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
      #print "\e[H\e[2J"
      puts "\n\n * * * \n\n"
      #ψ ]] Recalculate end time
      nogverwacht = @totaalseconden - @afgerond[@teller]
      starttijd = Time.now()
      @doeltijd = starttijd + @doel
      endtime = starttijd + nogverwacht
      lowtgttime = @doeltijd - @afwijking
      hightgttime = @doeltijd + @afwijking
      # TODO 20100802_1324 put all these calcs in log file for easy comparison
      
      # DONE 20100727_1121 20100726_0934 announce seconds as human-understandable minutes and seconds
      puts("#{activiteit.upcase}")
      say("#{activiteit}")
      puts "#{(@doel - @afwijking).to_human} to #{(@doel + @afwijking).to_human}."
      File.open("/tmp/routinetracker.log", 'w+')  do |f|
        f.write("#{activiteit}, " + lowtgttime.strftime("%H:%M") + "–" + hightgttime.strftime("%H:%M") + "   \t\n")
      end
      
      #ψ ]] Start the clock
      puts "Starting #{starttijd.strftime("%H:%M:%S")}, finish between #{lowtgttime.strftime("%H:%M:%S")} and #{hightgttime.strftime("%H:%M:%S")}"

      #ψ ]] Say title, counter against target
      say "Done #{endtime.strftime("%H:%M")}?"
      puts "Projecting routine finish by #{endtime.strftime("%H:%M:%S")} "

      #ψ ]] Wait for user input
      statusinput = Readline.readline('[f]inished [s]kip [r]estart [e]xception ',true)
      # TODO 20100802_1325 Add "Combine with previous" option
      # TODO 20100725_1010 Add Pause option
      status = statusinput[0..0]

      #ψ ]] Process user input
      case status
      when "s"
        @gedaan = Time.now()
        @eindtijd = 0

      when "r"
        @gedaan = nil
        starttijd = Time.now()
        @doeltijd = starttijd + @doel
        say "Restarted"

      when "e"
        @gedaan = Time.now()
        @eindtijd = (starttijd - @gedaan)
        say "Exception"
        puts "Targeted #{@doel.to_human} \nFinished in #{-@eindtijd.to_human} \nException noted" 

      else
        @gedaan = Time.now()
        @eindtijd = (@gedaan - starttijd)
        say("#{@eindtijd.to_human}") 
        puts "Targeted #{@doel.to_human} \nFinished #{@gedaan.strftime("%H:%M:%S")} in #{@eindtijd.to_human} " 

        #ψ Evaluate result and give user feedback
        # unless the task was canceled or marked as an exception

        # DONE 20100731_1916  20100726_0930 base score calculation on STDEVs, mins and maxs
        if @eindtijd > @doel then
          score = ((@eindtijd - @doel) / @afwijking )
          teken = "slow"
        else
          score = ((@doel - @eindtijd) / @afwijking )
          teken = "fast"
        end
        # TODO 20100802_1327 Exception generates an error due to "saying" a negative value
        
        if score != 0 then
            detailscore = ((10.0 *score).round)/10.0
            shout "#{detailscore.to_s} #{teken} "
          case score.round
          when 0
            shout "Right on track"
          when 1
            shout "Near enough"
          else
            shout "Finished"
          end     
        end

      end
      # TODO 20100802_1328 Ask user for notes at end of task

    end #ψ End while user not finished


    #ψ ] Store real end time
    if @eindtijd != 0
      waarden.unshift(@eindtijd).sort!
    end # if @eindtijd
    # DONE 20100725_0828 reproject end time 20100726_1229
    #ψ Store data for next time
    # DONE 20100802_1327 - save values on every loop
    File.open( @laadbestand, 'w' ) do |out|
      YAML.dump( @tasks, out )
    end
    File.open("/tmp/routinetracker.log", 'w+')  do |f|
      f.write("RoutineTracker IDLE  \t\n")
    end
  end #ψ End loop through defined task
  # TODO 20100725_0828 report total score
end






