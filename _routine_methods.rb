#!/usr/bin/env ruby

# ===========
# = Methods =
# ===========
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

  # variance necessary for standard deviation, copied from "# Statistical methods for arrays. Also see NArray Ruby library."
  def variance
    m = self.mean
    sum = 0.0
    self.each {|v| sum += (v-m)**2 }
    sum/self.size
  end

  def stdev
    Math.sqrt(self.variance)
  end

  def stdev_notzero
    s = self.stdev
    if s == 0 then
      # check if the average is a real value
      if self.mean == 0
        # if not, just take one second as an assumption
        s = 1
      else
        # otherwise, we take 10% deviation as an assumption
        s = ( self.mean / 10 )
      end
    end
    return s
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


# 2010-08-19_1838-0700 NICETOHAVE replace with specific Duration class?
class Numeric
  
  def to_minuteur
    basistijd = Time.gm(2010,"jan",1,0,0,0)
    return (basistijd + self).strftime("%H%M%S")
  end
  
  
  def to_human
    seconden = self.to_f
    if seconden < 0 then
      frontstring = "Exception "
      seconden = 0 - seconden
    end
    dagen = (seconden / 86400 ).to_i
    secondenmindagen = seconden - (86400 * dagen)
    uren = (secondenmindagen / 3600).to_i
    secondenminuren = secondenmindagen - (3600 * uren)
    minuten = (secondenminuren / 60).to_i
    restseconden = (seconden.to_i % 60)

    # TODO 2010-08-19_1843-0700 clean up hours-minutes-seconds calculation in line with how I do it for to_minuteur
    ignoreseconds = nil

    case dagen
    when 0
      dagenstring = ""
    when 1
      dagenstring = "#{dagen.to_s} tasks "
    else 2
      dagenstring = "#{dagen.to_s} tasks "
    end

    case uren
    when 0
      urenstring = ""
    when 1
      urenstring = "#{uren.to_s} hour "
      ignoreseconds = true
    else 2
      urenstring = "#{uren.to_s} hours "
      ignoreseconds = true
    end

    case minuten
    when 0
      minutenstring = ""
    when 1
      minutenstring = "#{minuten.to_s} minute "
    when 2..5
      minutenstring = "#{minuten.to_s} minutes "
    else
      afgerondeminuten = minuten + (restseconden / 60).round
      minutenstring = " #{afgerondeminuten.to_s} minutes "
      ignoreseconds = true
    end

    case restseconden
    when 0
      secondenstring = "precisely"
    when 1
      secondenstring = restseconden.to_s + " second"
    else
      secondenstring = restseconden.to_s + " seconds"
    end

    if ignoreseconds then
      return dagenstring + urenstring + minutenstring
    else
      return dagenstring + urenstring + minutenstring + secondenstring
    end
  end
end


# require 'arrayx' # separate post
#
# # Statistical methods for arrays. Also see NArray Ruby library.
#
# class Float
#
#   def roundf(decimel_places)
#       temp = self.to_s.length
#       sprintf("%#{temp}.#{decimel_places}f",self).to_f
#   end
#
# end
#
# class Integer
#
#   # For easy reading e.g. 10000 -> 10,000 or 1000000 -> 100,000
#   # Call with argument to specify delimiter.
#
#   def ts(delimiter=',')
#     st = self.to_s.reverse
#     r = ""
#     max = if st[-1].chr == '-'
#       st.size - 1
#     else
#       st.size
#     end
#     if st.to_i == st.to_f
#       1.upto(st.size) {|i| r << st[i-1].chr ; r << delimiter if i%3 == 0 and i < max}
#     else
#       start = nil
#       1.upto(st.size) {|i|
#         r << st[i-1].chr
#         start = 0 if r[-1].chr == '.' and not start
#         if start
#           r << delimiter if start % 3 == 0 and start != 0  and i < max
#           start += 1
#         end
#       }
#     end
#     r.reverse
#   end
#
# end
#
# =======================================================
# = From http://codesnippets.joyent.com/posts/show/1159 =
# =======================================================
# require 'arrayx' # separate post
#
# # Statistical methods for arrays. Also see NArray Ruby library.
#
# class Float
#
#   def roundf(decimel_places)
#       temp = self.to_s.length
#       sprintf("%#{temp}.#{decimel_places}f",self).to_f
#   end
#
# end
#
# class Integer
#
#   # For easy reading e.g. 10000 -> 10,000 or 1000000 -> 100,000
#   # Call with argument to specify delimiter.
#
#   def ts(delimiter=',')
#     st = self.to_s.reverse
#     r = ""
#     max = if st[-1].chr == '-'
#       st.size - 1
#     else
#       st.size
#     end
#     if st.to_i == st.to_f
#       1.upto(st.size) {|i| r << st[i-1].chr ; r << delimiter if i%3 == 0 and i < max}
#     else
#       start = nil
#       1.upto(st.size) {|i|
#         r << st[i-1].chr
#         start = 0 if r[-1].chr == '.' and not start
#         if start
#           r << delimiter if start % 3 == 0 and start != 0  and i < max
#           start += 1
#         end
#       }
#     end
#     r.reverse
#   end
#
# end

# class Array
#
#   def sum
#     inject( nil ) { |sum,x| sum ? sum+x : x }
#   end
#
#   def mean
#     sum=0
#     self.each {|v| sum += v}
#     sum/self.size.to_f
#   end
#
#   def variance
#     m = self.mean
#     sum = 0.0
#     self.each {|v| sum += (v-m)**2 }
#     sum/self.size
#   end
#
#   def stdev
#     Math.sqrt(self.variance)
#   end
#
#   def count                                 # => Returns a hash of objects and their frequencies within array.
#     k=Hash.new(0)
#     self.each {|x| k[x]+=1 }
#     k
#   end
#
#   def ^(other)                              # => Given two arrays a and b, a^b returns a new array of objects *not* found in the union of both.
#     (self | other) - (self & other)
#   end
#
#   def freq(x)                               # => Returns the frequency of x within array.
#     h = self.count
#     h(x)
#   end
#
#   def maxcount                              # => Returns highest count of any object within array.
#     h = self.count
#     x = h.values.max
#   end
#
#   def mincount                              # => Returns lowest count of any object within array.
#     h = self.count
#     x = h.values.min
#   end
#
#   def outliers(x)                           # => Returns a new array of object(s) with x highest count(s) within array.
#     h = self.count
#     min = self.count.values.uniq.sort.reverse.first(x).min
#     h.delete_if { |x,y| y < min }.keys.sort
#   end
#
#   def zscore(value)                         # => Standard deviations of value from mean of dataset.
#     (value - mean) / stdev
#   end
#
# end
