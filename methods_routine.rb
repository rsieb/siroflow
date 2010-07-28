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

def median(array)
  return nil if array.empty?
  return array[0] if array.size == 1
  array = array.sort
  #@log.debug("Mediaanwaarden zijn #{array.inspect} #{array.class}")
  m_pos = (array.size / 2)
  #@log.debug("Gekozen mediaanpositie is #{m_pos.inspect} #{m_pos.class}")
  if array.size % 2 == 1 then
    #@log.debug("Mediaan is waarde op positie #{m_pos} = #{array[m_pos]}")
    return array[m_pos]
  else
    mymedian = (array[m_pos-1] + array[m_pos])/2
    #@log.debug("Mediaan is gemiddelde van waarden op positie #{m_pos-1} en #{m_pos} = #{mymedian}")
    return mymedian
  end
end

class Numeric
  def to_human
    seconden = self.to_f
    minuten = (seconden / 60).to_i
    restseconden = (seconden.to_i % 60)
    case restseconden
    when 0
      secondenstring = " exact"
    when 1
      secondenstring = restseconden.to_s + " second"
    else
      secondenstring = restseconden.to_s + " seconds"
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
