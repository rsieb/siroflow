#!/usr/bin/env ruby -wKU

SECONDSCORRECTION = 0.99 # of normally calculated time
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
  unless File.exist?("/Users/rs/Desktop/silent") then
    system("say #{saying}")
  end
end

def shout(saying)
  puts saying
  say(saying)
end

#pseudo read input as number of seconds


feedbackloop = {
	0.0 => "Starting",
	0.1 => "10% done",
	0.2 => "One fifth",
	0.33 => "One third",
	0.5  => "Halfway",
	0.67 => "Two thirds",
	0.8	 => "20% left",
	0.9	 => "10% left",
	0.925 => "Finish up now",
	0.95 => "Almost done",
	0.96 => "In four",
	0.97 => "In three in three",
	0.98 => "In two in two in two",
	0.99 => "In one in one in one in one",
	1.0 => "Time is up!"
}

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
tijdserie.each do |mijnhash|
	@reltime = (mijnhash[0]-teller)*SECONDSCORRECTION
	teller = teller + @reltime
	mijnhash[0]=@reltime
end
# 
# puts tijdserie.inspect
# puts tijdserie.class

#pseudo run array#pseudo 
tijdserie.each do |wachten|
	sleep wachten[0]
	shout($taskname + " " + wachten[1])
end

# now start bugging me
1000.times.each do |keer|
	shout "Finish #{$taskname}"
	sleep 1
end

