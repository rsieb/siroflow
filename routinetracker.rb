#!/usr/bin/env ruby

#ψ Set up libraries and data definitions


require 'yaml'

require 'logger'
@log=Logger.new(STDOUT)
@log.level = Logger::INFO

require 'readline'
# Store the state of the terminal
stty_save = `stty -g`.chomp
trap('INT') { system('stty', stty_save); exit }

require '_routine_methods'

#ψ Get data (1) in-file (2) from external file or sqlite dbase (sync'ing) (3) from a choice of multiple data sets

print "\e[H\e[2J"
puts "\nWelcome to RoutineTracker!\n"
say "Welcome!"
puts "\nLooking for files ending in .routine.yaml ...\n"
@keuze = Dir.glob("*.routine.yaml")
#@log.debug(@keuze.inspect)
@keuze.each_index do |number|
  # correcting for counting from 1 to reserve 0 value for strings and cancellatons
  puts "[#{number+1}] #{@keuze[number]}"
end
mijnkeuze = Readline.readline('> ', true)
doen = mijnkeuze[0..0].to_i
#@log.debug(doen.inspect)
@laadbestand = @keuze[doen-1]
#@log.debug(@laadbestand.inspect)
unless (  defined?(@laadbestand) && @laadbestand != nil )
  puts "Your choice was not valid. Exiting."
  exit 1
end

puts "Loading #{@laadbestand}..."
@tasks = YAML.load_file( @laadbestand )
#@log.debug(@tasks.inspect)

#ψ Calculate totals
@totaalseconden = 0
@afgerond = Array.new()
@tasks.each_index do |nummer|
  #@log.debug("@tasks[#{nummer}] is #{@tasks[nummer].inspect} #{@tasks[nummer].class}")
  # taak.class = Hash ; taak.inspect ="Sit down"=>[5, 8, 3]}      
  @tasks[nummer].each do |naam,waarden|
    # store the target seconds already done at the beginning of each task
    @afgerond[nummer] = @totaalseconden
    #@log.debug("@afgerond[#{nummer}] is #{@afgerond[nummer].inspect} #{@afgerond[nummer].class}")
    # FIXED 20100726_0942 heb ik "@totaalseconden" überhaupt nog nodig? Ja om projecties te berekenen
    # FIXED 20100726_2128 adding 5 seconds to compensate for all the speaking
    @totaalseconden = @totaalseconden + waarden[0]
    #@log.debug("@totaalseconden is #{@totaalseconden.inspect} #{@totaalseconden.class}")
  end
end
#@log.debug("Totaalseconden is #{@totaalseconden}")
#@log.debug("@afgerond is #{@afgerond.inspect} #{@afgerond.class}")                                                  ; @log.level = Logger::INFO

# ======================
# = Loop through tasks =
# ======================
@tasks.each do |taak|
  @teller = @tasks.index(taak)
  @log.debug("@teller is #{@teller.inspect} #{@teller.class}")
  @log.debug("taak is #{taak.inspect} #{taak.class}")
  # taak.each do |naam,waarden|
  #   puts naam.inspect
  #   puts waarden.inspect
  # end
  # break

  taak.each do |naam,waarden|
    #ψ ] Read title, target, set counter
    activiteit = naam
    @log.debug "activiteit = #{activiteit}"
    # TODO 20100726_0931 move target calculation to beginning of code, keeping only real results in database?
    @doel = waarden[0]
    @log.debug "@doel = #{@doel} seconden"
    @gedaan = nil
    # =======================
    # = Task Restart loop =
    # =======================
    while @gedaan == nil
      print "\e[H\e[2J"
      #ψ ]] Recalculate end time
      # @log.level = Logger::DEBUG
      # @log.debug "@totaalseconden = #{@totaalseconden} seconden"
      # @log.debug "@afgerond[#{@teller}] = #{@afgerond[@teller]} seconden"
      # @log.debug "@doel = #{@doel} seconden"
      nogverwacht = @totaalseconden - @afgerond[@teller]
      # @log.debug "nogverwacht = #{nogverwacht} seconden"
      starttijd = Time.now()
      # @log.debug "starttijd = #{starttijd}"
      @doeltijd = starttijd + @doel
      # @log.debug "@doeltijd = #{@doeltijd}"
      endtime = starttijd + nogverwacht
      # @log.debug "endtime = #{endtime.strftime("%H:%M:%S")} "
      #ψ ]] Say title, counter against target
      # FIXED 20100727_1121 20100726_0934 announce seconds as human-understandable minutes and seconds
      shout("#{activiteit}, #{(@doel).to_human}.")
      #ψ ]] Start the clock
      puts "Starting #{starttijd.strftime("%H:%M")}, finish by #{@doeltijd.strftime("%H:%M")}"
      puts "Routine done by #{endtime.strftime("%H:%M")} "
      # @log.level = Logger::INFO

      #ψ ]] Wait for user input
      statusinput = Readline.readline('[f]inished [s]kip [r]estart [e]xception ',true)
      # TODO 20100725_1010 Add Pause option
      status = statusinput[0..0]
      # @log.debug "status = #{status}"

      #ψ ]] Process user input
      case status
      when "s"
        # @log.debug "SKIP"        
        @gedaan = Time.now()
        # @log.debug "@gedaan = #{@gedaan}"        
        @eindtijd = 0
        # @log.debug "@eindtijd = #{@eindtijd}"    

      when "r"
        # @log.debug "RESTART"        
        @gedaan = nil
        # @log.debug "@gedaan = #{@gedaan}"        
        starttijd = Time.now()
        # @log.debug "starttijd = #{starttijd}"        
        @doeltijd = starttijd + @doel
        # @log.debug "@doel = #{@doel}"        
        say "Restarted"

      when "e"
        # @log.debug "EXCEPTION"        
        @gedaan = Time.now()
        # @log.debug "@gedaan = #{@gedaan}"        
        @eindtijd = (starttijd - @gedaan)
        # @log.debug "@eindtijd = #{@eindtijd}"        
        say "Exception"
        puts "Targeted #{@doel.to_human} \nFinished in #{-@eindtijd.to_human} \nException noted" 

      else
        # @log.debug "status = f"        
        @gedaan = Time.now()
        # @log.debug "@gedaan = #{@gedaan}"        
        @eindtijd = (@gedaan - starttijd)
        # @log.debug "@eindtijd = #{@eindtijd}"        
        say("#{@eindtijd.to_human}") 
        puts "Targeted #{@doel.to_human} \nFinished in #{@eindtijd.to_human} " 
      end

    end #ψ End while user not finished


    #ψ Evaluate result and give user feedback
    # @log.debug "@doel is #{@doel}"
    # @log.debug "@eindtijd is #{@eindtijd}"
    # TODO 20100726_0930 base score calculation on STDEVs, mins and maxs
    score = (100 * @eindtijd / @doel).to_i
    if score > 0 then
      #shout("#{score} percent")
      # @log.debug "Score is #{score}"
      case score
      when 0..10
        shout "Skipped"
      when 11..20
        shout "Too low?" 
      when 21..33
        shout "Very low"
      when 34..50
        shout "Low"
      when 51..66
        shout "Lowish"
      when 67..133
        shout "In range" 
      when 134..199
        shout "Highish" 
      when 200..299
        shout "High" 
      when 300..499
        shout("Very high") 
      when 500..999
        shout("Too high?") 
      when 1000..10000
        shout("Exception?") 
      else
        shout("...out of range...")
      end     
    end
    # @log.debug "@gedaan = #{@gedaan}"
    # @log.debug "@eindtijd = #{@eindtijd}"
    #ψ ] Store real end time
    if @eindtijd != 0
      waarden.insert(1,@eindtijd)
      aantal = waarden.size - 1
      waarden[0] = waarden[1..aantal].valid_stats.median
      @log.debug "Mediaan (waarden[0]) is #{waarden[0]}"
    end # if @eindtijd
    # DONE 20100725_0828 reproject end time 20100726_1229
    #ψ Store data for next time
    #@log.debug "Tasks array is now #{@tasks.inspect}"
    File.open( @laadbestand, 'w' ) do |out|
      YAML.dump( @tasks, out )
    end
  end #ψ End loop through defined task
  # TODO 20100725_0828 report total score
end






