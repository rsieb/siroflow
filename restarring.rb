#!/usr/bin/env ruby
#!/usr/bin/env ruby -wKU
# encoding: UTF-8

require 'rubygems'
require 'toodledo'


##### Get all open tasks
config = {
  "connection" => { 
    "url" => "http://www.toodledo.com/api.php",
    "user_id" => "td494f23fab7b72",
    "password" => "ueb0y?Qatar"
  }
}
Toodledo.set_config(config)
Toodledo.begin do |session|

  criteria = { :notcomp => true }
  @tasks = session.get_tasks(criteria)



  n = @tasks.size
  i = 0

  until i = n - 1
    @task
    @tasks.each_index do |mijntaak|
      print "\e[H\e[2J"
      puts "Do I resist\n\n #{@tasks[mijntaak].title} \n\nmore than\n\n #{@tasks[mijntaak+1].title} \n\n?"
    end
    #####  star task(counter)
    #####  subcounter is one
    #####  do I resist task(counter+subcounter) more than task(counter)?
    #####    if no then
    #####      subcounter++
    #####      repeat
    #####    else (if yes) then
    #####      repeat bigger loop
    #####    end
    #####  end
    ##### 
end
end