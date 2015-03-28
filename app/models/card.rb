class Card < Assignment

  def self.model_name
    Assignment.model_name
  end

  def self.avg_per_day(enddate=Time.now())
    startdate=enddate-(1.week)
    donecards = Card.where("(status = 'Done' or closed = ?) and updated_at_native > ? and updated_at_native <= ?",true, startdate,enddate)
    timepassed = (Time.now() - donecards.minimum(:updated_at_native)) / 86400
    return (donecards.size)/timepassed
  end

end
