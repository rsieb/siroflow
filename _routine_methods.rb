#!/usr/bin/env ruby

# ===========
# = Methods =
# ===========
def say(saying)
  system("say #{saying}")
  #@log.debug "Said #{saying}"
end

def shout(saying)
  puts saying
  say(saying)
  #@log.debug "Putting and saying #{saying}"
end 



=begin
# ================
# = For recoding =
# ================

# @log.debug "Nieuwe waarden zijn #{waarden.inspect}"
geldige = 0
totaal = 0
mediaanwaarden = Array.new()
grootte = waarden.size
# @log.debug "Grootte is #{grootte}"
waarden[1..grootte].each do |tijd|
  # @log.debug "Tijd is #{tijd.inspect} van soort #{tijd.class}"
  if tijd > 0
    geldige = geldige + 1
    # @log.debug "Geldige is #{geldige}"
    mediaanwaarden.push(tijd.to_f)
    # @log.debug "Mediaanwaarden zijn #{mediaanwaarden.inspect}"
    totaal = totaal + tijd
    # @log.debug "Totaal is #{totaal}" 
  end # if tijd > 0
end #waarden.each
if geldige > 0
  # FIXED 20100726_1248  20100726_1230 change average to median 
  gemiddeld = (totaal / geldige)
  mediaan = median(mediaanwaarden)
else
  gemiddeld = @eindtijd
end
# @log.debug "Gemiddeld is #{gemiddeld}"
# @log.debug "Mediaan is #{mediaan}"
# TODO 20100726_0932 add leeway to target?
#      waarden[0] = gemiddeld
=end


class Array
  #Reduces an array only to the values higher than 0
  def valid_stats
    return nil if self.empty?
    geldige = Array.new()
    self.each do |tijd|
      if tijd > 0 then
        geldige.push(tijd)
      end
    end
    return geldige
  end

  # mathematical mean
  def mean
    return nil if self.empty?
    return self[0] if self.size == 1
    totaal = 0 
    self.each do |getal|
      totaal = totaal + getal.to_f  
    end
    return totaal/(self.size)
  end  

  def median
    # TODO 20100730_1116 integrated in Array class, still untested!
    return nil if self.empty?
    return self[0] if self.size == 1
    self.sort!
    #@log.debug("Mediaanwaarden zijn #{array.inspect} #{array.class}")
    m_pos = (self.size / 2)
    #@log.debug("Gekozen mediaanpositie is #{m_pos.inspect} #{m_pos.class}")
    if self.size % 2 == 1 then
      #@log.debug("Mediaan is waarde op positie #{m_pos} = #{array[m_pos]}")
      return self[m_pos]
    else
      mymedian = (self[m_pos-1].to_f + self[m_pos].to_f)/2
      #@log.debug("Mediaan is gemiddelde van waarden op positie #{m_pos-1} en #{m_pos} = #{mymedian}")
      return mymedian
    end
  end

    
end



class Numeric
  def to_human
    seconden = self.to_f
    if seconden < 0 then
      frontstring = "Exception "
      seconden = 0 - seconden
    end
      minuten = (seconden / 60).to_i
    restseconden = (seconden.to_i % 60)
    case restseconden
    when 0
      secondenstring = " exact"
    when 1..5
      secondenstring = restseconden.to_s + " second"
    else
      secondenstring = ""
    end
    case minuten
    when 0
      return secondenstring
    when 1  
      return minuten.to_s + " minute " + secondenstring
    else
      return minuten.to_s + " minutes " + secondenstring
    end
  end
end
