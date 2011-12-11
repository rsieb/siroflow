#!/usr/bin/env ruby -wKU
require './_routine_methods'

puts RUBY_VERSION

SECONDSCORRECTION = 2.3 # of normally calculated time per comment
$taskname = ARGV[0].to_s
$inputtime = ARGV[1].to_f

#pseudo function to calculcate time as percentage
def percent_to_seconds(seconds,fraction)
  (seconds.to_f * fraction).round(1)
end

#pseudo function to compose array of callouts and pauses
def make_time_series(seconds,series)
  if series.respond_to?("each") 
    myseries = Array.new()
    series.each do |percentage|
      myseries.push(percent_to_seconds(seconds,percentage))
    end
  else
    raise NoMethodError 
  end
  return myseries
end

def say(saying)
  system("/usr/local/bin/growlnotify -p 0 -m \"#{saying}\" ")
  puts "#{saying}"
  unless File.exist?("/Users/rs/Desktop/silent") then
    system("say #{saying}")
  end
end

# Randomize terminal color, I want some color in my life!
system("/usr/bin/osascript /Users/rs/Dropbox/Library/Scripts/Applications/Terminal/RandomColorTerminal.scpt")

#pseudo read input as number of seconds
if $inputtime > 60
  feedbackloop = {
    0.0 => "Starting",
    0.1 => "10%",
    0.2 => "20",
    0.3 => "30",
    0.4 => "40",
    # 0.33 => "One third",
    0.5  => "Halfway",
    # 0.67 => "Two thirds",
    0.54	 => "54",
    0.58	 => "58",
    0.62	 => "62",
    0.66	 => "66",
    0.7	 => "70",
    0.73	 => "73",
    0.77	 => "77",
    0.80	 => "80"
  }
  5.times do |seconde|
    sleutel = (80.0 + (2 * seconde.to_f))/100
    feedbackloop[sleutel] = "#{80+(2*seconde)}"
  end
  11.times do |seconde|
    sleutel = (90.0 + seconde.to_f)/100
    feedbackloop[sleutel] = "#{90+seconde}"
  end
else
  feedbackloop = {
    0.0 => "Starting",
    0.25 => "One quarter",
    0.5  => "Halfway",
    0.67 => "Three quarters",
    0.8	 => "10% left",
    0.97 => "In three",
    0.99 => "In one",
    1.0 => "Time is up!"
  }
end



# puts feedbackloop.inspect
# puts feedbackloop.class

tijdloop = Hash.new()
feedbackloop.each do |voorbij,uitspraak|
  tijdloop[percent_to_seconds($inputtime,voorbij)]=uitspraak
end

# puts tijdloop.inspect
# puts tijdloop.class

# pseudo construct array with breaks
tijdserie = tijdloop.sort
teller = 0.0
tijdserie.each_index do |mijnhash|
  berekend = (tijdserie[mijnhash][0] - teller - mijnhash * SECONDSCORRECTION) 	  
  @reltime = [ 0, berekend].max
  teller = teller + @reltime
  tijdserie[mijnhash][0]=@reltime
end
# 
# puts tijdserie.inspect
# puts tijdserie.class

#pseudo run array#pseudo 
say $taskname
tijdserie.each do |wachten|
  sleep wachten[0]
  #	say($taskname + " " + wachten[1])
  say(wachten[1])
end

# now start bugging me
@starttime = Time.now()
1000.times.each do |keer|
  @delay = Time.now()-@starttime
  say "#{@delay.to_f.to_human}"
end

