module RoutineTracker
  class Activity

    def self.target
      currentappts = Appscript::app("iCal").calendars["Planning"].events.get.find_all{|mtg|
        mtg.start_date.get < Time.now() && mtg.end_date.get > Time.now()
      }
      begin
          return currentappt = currentappts.first.summary.get
        rescue
          return "goodtodo"
        end          
      # if ( !currentappt || currentappt == :missing_value )
      #   return "goodtodo"
      # else
      #   return currentappt
      # end
    end

    def self.idle?(summary)
      summary.match("IDLE").to_s.size > 0
    end

    def self.actual
      Log.instance.contents.split(' #')[0]
    end

  end
end