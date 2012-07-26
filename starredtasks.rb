#!/usr/bin/env ruby
# encoding: UTF-8
#!/usr/bin/env ruby -wKU

# TODO 2012-07-25 refactor this into its own object with initialization code and hotlist method

require 'rubygems'
require 'toodledo'
require 'yaml'
require 'chronic'

@uitput = ""
goals = Array.new()

config = {
  "connection" => { 
    "url" => "http://www.toodledo.com/api.php",
    "user_id" => "td494f23fab7b72",
    "password" => "ueb0y?Qatar"
  }
}
Toodledo.set_config(config)
Toodledo.begin do |session|

  goals = session.get_goals()

  toodaaay = Chronic.parse("tomorrow").strftime("%Y-%m-%d") 
  criteria2 = { :notcomp => true, :star => false, :before => toodaaay  }
  tasks2 = session.get_tasks(criteria2)

  criteria1 = { :star => true, :notcomp => true }
  tasks1 = session.get_tasks(criteria1)


  tasks = tasks2 + tasks1
  #puts tasks2.first.inspect

  if tasks.size == 0 then
    tasks.push("F yeah restar my tasklist ®restar +0pvy")
  end

  tasks.each do |taak| 
    taak.title.gsub!(/[^A-Za-z0-9_+\/® ]/, '')
    if (taak.goal.name && taak.goal.name != "No goal")
      # TODO 2012-07-25 refactor this so that it is not a string but an array
      @uitput = @uitput + taak.title + " +" + taak.goal.name.to_s + "\n"
    else
      @uitput = @uitput + "\n" + taak.title.sub(" _", " +") + "\n"
    end
    # puts taak.title + " @" + taak._id
  end
end
puts @uitput
