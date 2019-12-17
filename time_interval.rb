# For testing coersion modification

class TimeInterval
 attr_reader :value # in total seconds

 def initialize(value)
   @value = value.to_i
 end

 def self.parse(string)
   minutes, seconds = string.split(':').map(&:to_i)
   new((minutes * 60) + seconds)
 end

 def minutes
   value / 60
 end

 def seconds
   value % 60
 end

 def to_s
   "#{minutes}:#{seconds}"
 end

  def +(other)
    if other.is_a? TimeInterval
      TimeInterval.new(value + other.value)
    elsif other.is_a? Numeric
      TimeInterval.new(value + other)
    else
      raise TypeError, "#{other.class} can't be coerced into TimeInterval"
    end
  end

  def coerce(other)
    [TimeInterval.new(other), self]
  end

end



#inital example
puts 'INITIAL EXAMPLE'
puts '---------------'
puts 'TimeInterval.new(75)'
p TimeInterval.new(75)
puts 'TimeInterval.parse("1:15")'
p TimeInterval.parse("1:15")
puts 'TimeInterval.parse("1:15").to_s'
p TimeInterval.parse("1:15").to_s

#addition example, each addition returns new timeinterval object

# when another object (fixnum) doesn't know how to coerce/extract values from our object, ruby gives the option to specify a coerce method on the timeinterval object, which the coercing object will call and place itself as an arugment, you can then convert the object (fixnum) to specify and return the values in an array to coerce instead using the addition objects (time intervals) method instead.
#note if coecrsion method doesnt convert the objects into two which can be coecrsed, it will create an infinite loop (stack level too deep error) Make sure first object in array is same as class type

puts 'ADDITION EXAMPLE'
puts '---------------'
i = TimeInterval.parse "1:15"
puts 'interval add 5s'
p (i + 5).to_s  #left side works
puts '5s add interval'
p (5 + i).to_s  # originally right side doesn't since fixnum doesn't know how to add itself to the time interval object, once coerce method added to timeinterval this should be fixed
