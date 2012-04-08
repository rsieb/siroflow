module RoutineTracker

  ACTIVITYFILE = "/tmp/routinetracker.log"
  IDLEMARKER = "•"

  class Log

    attr_reader :contents

    def initialize
      unless File.exist?(ACTIVITYFILE)
        f = File.new(ACTIVITYFILE, "w+")
        f.write("IDLE #{IDLEMARKER}")
        f.close        
      end
      @reader = File.open(ACTIVITYFILE, "r")
      @contents = @reader.gets
      @reader.close
    end

    @@instance = Log.new

    def self.instance
      return @@instance
    end

    def idle
      @writer = File.open(ACTIVITYFILE, "a")
      @writer.write("#{IDLEMARKER}")
      @writer.close
    end

  end

end