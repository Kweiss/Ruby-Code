# Playing with class variables, as per Michael Fitzgerald's Learning Ruby
	# Chapter 9.4, Class Variables

class Repeat
	@@total = 0

	def initialize(string, times)
		@string = string
		@times = times
	end

	def repeat
		@@total += @times
		return @string * @times
	end

	def total
		"Total times, so far: " + @@total.to_s
	end

end

data  = Repeat.new("ack ", 8)
ditto = Repeat.new("Again! ", 5)
ditty = Repeat.new("Rinse. Lather. Repeat. ", 2)

puts data.repeat
puts data.total
puts
# Above, data.total returns 8...

puts ditto.repeat
puts ditto.total
puts
# ...here, ditto.total returns 13...

puts ditty.repeat
puts ditty.total
puts
# ...and lastly, ditty.total returns 15

# Even though data, ditto and ditty are each different objects (the following all evaluate to true)...
	# puts data.object_id != ditto.object_id
	# puts ditto.object_id != ditty.object_id
	# puts ditty.object_id != data.object_id

# ...@@total continues to increment across all instances of the Repeat object (through .total).

# The first set of evaluations runs through the variable data; times/@times == 8, and @@total += @times.
# @@total is initially 0, and then 8 gets added to it.

# Next, the second set of evaluations runs through the variable ditto; times/@times == 5, and @@total += @times.
# @@total is 8, because of data's existence/use of @@total, and 5 is then added to that (8 + 5 => 13).

# Lastly, the thrid set of evaluations runs through the variable ditty; times/@times == 2, and @@total += @times.
# @@total is 13, because of data's and ditto's existence/use of @@total, and 2 is added to that (8 + 5 => 13 + 2 => 15).
