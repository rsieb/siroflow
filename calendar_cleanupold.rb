#!/usr/bin/env ruby -wKU
# encoding: UTF-8

#ψ load relevant modules
require 'rubygems'
require 'appscript'
require 'time'
require 'chronic'
#require 'activesupport'
require 'yaml'

# ==================
# = Activity class =
# ==================
class Activity_view

  def puts(table)
    table.each do |k,v|
      if (k == "Hours" || k == "Tasks" ) then
        puts "#{k.ljust(10)}: #{v.round.to_s.rjust(3)}"
      else
        puts "#{k.ljust(10)}: #{v.round.to_s.rjust(3)}%"
      end
    end
    return true
  end

end


# ===============================
# = Set BEGINTIME manually here =
# ===============================
@begintime = Chronic.parse("April 1st, 2013")
@mijnkalenders=['Tracker'] # RS 2012-08-27 adding work calender here does not work
#ψ initialize variables
@cleantime=Chronic.parse("120 days ago")
@datadir="/Users/rs/Library/Scripts/workloop"
@loadfile="#{@datadir}/weekloop.yaml"
@backupfile="#{@datadir}/weekloop.bak.yaml"
@waslijstbestand="#{@datadir}/waslijst.yaml"
@endtime=Time.now



zicht = Activity_view.new()
ical = Appscript::app('Calendar')

@daysactive=((Time.now()-@begintime)/86400).to_f
#@begintime=Chronic.parse("July 1st, 1am")
#puts "INFO @begintime = #{@begintime} "
@scoreboard = Hash.new()
@relscoreboard = Hash.new()
@geschiedenis = Hash.new()
@waslijst = Hash.new()
@teller = 0
@totdur = 0
@evenementen = Array.new()

#ψ get relevant data from ical

@mijnkalenders.each do |kalendertje| 
  ical.calendars[kalendertje].events.get.each do |afspraak|

    begin
      @summary = afspraak.summary.get.encode("iso-8859-1", :invalid => :replace, :undef => :replace, :replace => "").force_encoding('iso-8859-1')
    rescue
      @summary = "NO SUMMARY FOUND"
    end
    @starttime = afspraak.start_date.get
    if (@starttime < @cleantime && @starttime < @begintime) then
      afspraak.delete
      puts "#{@starttime.strftime("%Y%m%d%H%M")} #{@summary}"
      puts " Deleted"
    elsif (@starttime > @cleantime && @starttime < @begintime) then
      #ignore
    elsif (@starttime > @begintime && @starttime < @endtime ) then
      puts " Counted"
      @id = afspraak.id_.get
      @summary = afspraak.summary.get
      @duration = ((afspraak.end_date.get - @starttime)/1800.0).to_f # in rounded half hours = pomodori
      #    @duration = 1 # in pomodori regardless of the duration
      #@title = @summary.partition(" +")[0].partition(" ")[2] # may cause problems with Unicode
      @title = @summary.partition(" +")[0]
      #    @tags = @summary.scan(/#g\w+|#c\w|#f\w|#e\w|#s\w|#m\w|#o\w|#\w/) # filter out g goals separately
      #    @tags = @summary.scan(/#g\w+|#c\w+|#d\w+|#s\w+/) # filter out full words
      @tags = @summary.scan(/\+\w+/) # filter out full words
      #    @tags = @summary.scan(/#\w/) # only first letters
      puts "title: " + @title.inspect
      puts "starttime: " + @starttime.inspect
      puts "tags: " + @tags.inspect
      puts "tags size: " + @tags.size.inspect
      puts "summary: " + @summary.inspect
      if @tags.size == 0 then 
        @title = @summary.partition(" _")[0].partition(" ")[2] 
        @title.gsub!(/^A-Aa-z0-9+ \//," ")
        @tags = @summary.scan(/_\w+/)
      end
      if @tags.size == 0 then 
        @tags = ["NA"]
        #afspraak.summary.set("_NA #{@summary}") 
        @divider = 1.to_f
      else
        @divider = @tags.size.to_f
      end
      #      puts @divider.inspect

      @tags.each do |etiket|
        if @scoreboard[etiket] then
          @scoreboard[etiket] = @scoreboard[etiket] + ( @duration / @divider)
        else
          @scoreboard[etiket] =  ( @duration / @divider )
        end
        # expecting Array as the hash value
        if !@waslijst[etiket] then
          @waslijst[etiket] = Array.new()
        end
        #      @waslijst[etiket].push(@title + " " + @starttime.strftime("%c"))
        @waslijst[etiket].push(@title + " " + @starttime.strftime("%a%d@%H"))
        puts etiket.inspect
        puts @waslijst[etiket].inspect
        puts "Added #{@duration / @divider } pomodori to #{etiket}: #{@title}"
      end
      @teller = @teller + 1 
      @totdur = @totdur + @duration
    end
  end
end
# end

ical.calendars["Planning"].events.get.each do |afspraak|
  if ( afspraak.end_date.get < (Time.now - 12 *  60 * 60)) then
    afspraak.delete
  end
end

#ψ create score board
@scoreboard.each do |eetiket,uren|
  @scoreboard[eetiket] = (100 * uren.to_f / @totdur.to_f) # relative
  ##@scoreboard[eetiket] = uren #absolute
end
@scoreboard["Hours"] = @totdur.to_i
@scoreboard["H/day"] = (@totdur/@daysactive)
@scoreboard["Tasks"] = @teller.to_i
@eindscore = @scoreboard.sort{|k,v| v.reverse <=> k.reverse}

@geschiedenis[@endtime.strftime("%Y%m%d%H%M")] = @eindscore
File.open(@backupfile, 'w+')  do |out|
  YAML.dump( @geschiedenis, out )
end # File.open

if File.size?(@backupfile)
  File.rename(@backupfile,@loadfile)
end


#ψ display
File.open(@waslijstbestand, 'w+')  do |out|
  YAML.dump( @waslijst, out )
end # File.open


#zicht.puts(@eindscore) #generates error
@eindscore.each do |k,v|
  if (k == "Hours" || k == "Tasks" || k == "H/day" ) then
    puts "#{k.ljust(10)}: #{v.round.to_s.rjust(3)}"
  else
    puts "#{k.ljust(10)}: #{v.round.to_s.rjust(3)}%"
  end
end

#ψ put in notational velocity
@nvfile="/Users/rs/Dropbox/Elements/CurrentScore.txt"
File.open(@nvfile, 'w+')  do |out|
  @eindscore.each do |k,v|
    if (k == "Hours" || k == "Tasks" || k == "H/day") then
      out.write "#{k.ljust(10)}: #{v.round.to_s.rjust(3)}\n"
    else
      out.write "#{k.ljust(10)}: #{v.round.to_s.rjust(3)}%\n"
    end
  end
end  

Appscript::app("TextMate").open MacTypes::Alias.path(@waslijstbestand)
Appscript::app('TextMate').activate


