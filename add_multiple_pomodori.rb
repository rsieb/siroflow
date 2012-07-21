#!/usr/bin/env ruby

TOODLEDO = "/Users/rs/.rvm/gems/ruby-1.9.3-p194/bin/toodledo"
require "rubygems"
require "readline"

@task = ""
@goal = ""
@number = 0
@confirm = nil


while @task.size <= 10
  @task = Readline.readline("What is your reddest MBO task? \n> ",true).chomp
end
while @goal.size != 4
  @goal = Readline.readline("What is the Toodledo goal for `#{@task}`?\n" +'[....]> ',true).chomp
end
while @number < 2
  @number = Readline.readline("How many Pomodori would you like to add for `#{@task}`?\n[2-]> ",true).chomp.to_i
end
while @confirm == nil
  @confirm = Readline.readline("Add #{@number} Pomodori for `#{@task}` with goal `#{@goal}`?\n[y][N]\n> ",true)
end
if @confirm == "y"
  @number.times do |teller|
    # ttodo 2012-07-08 investigate why single asterisk is not working for starring a task. Code issue?
#    emailinput = "#{@task} #{@number - teller}/#{@number} * ^#{@goal} !High" 
    emailinput = "#{@task} #{@number - teller}/#{@number} +#{@goal} * $Next Action" 
    puts emailinput
    # FIXED using system call to Toodledo not working very well. Replace with email? http://solutionstudio.rs/mac-os-x-postfix-gmail-relay
    #system("#{TOODLEDO} add '#{emailinput} '")
    output = `echo "#{emailinput}" | mail rs69todos.157623@toodledo.com 2>&1 ` ; result=$?.success?
    puts result
  end
else
  puts "Canceled"
end

require 'net/smtp'
