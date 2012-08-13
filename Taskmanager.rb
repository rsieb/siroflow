#!/usr/bin/env ruby  -wKU
# encoding: UTF-8
#!/usr/bin/env ruby

require 'rubygems'
require 'toodledo'
require 'yaml'
require 'chronic'

module RoutineTracker
  class TaskManager
    def initialize
      config = {
        "connection" => { 
          "url" => "http://www.toodledo.com/api.php",
          "user_id" => "td494f23fab7b72",
          "password" => "ueb0y?Qatar"
        }
      }
      t = Toodledo.new()
      t.set_config(config)
      return t
    end
    
    @@instance = TaskManager.new

    def self.instance
      return @@instance
    end
    
    
    def alltasks
      @@instance.begin do |session|
        
        criteria = { :notcomp => true  }
        @tasks = session.get_tasks(criteria2)
        return @tasks
    end    
    
    def hotlist
      @uitput = ""
      goals = Array.new()

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
            @uitput = taak.title + " +" + taak.goal.name.to_s
          else
            @uitput = taak.title.sub(" _", " +")
          end
          # puts taak.title + " @" + taak._id
        end
      end
      return @uitput
    end
  end
end

