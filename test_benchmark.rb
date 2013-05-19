# Testing benchmark;
# also, seeing how much faster using symbols can be in Ruby, than using strings
require 'benchmark'

# Benchmark.measure will calculate how long it takes to perform/evaluate the specified code;
# In the below case, how long it takes to create a string consisting of 1,000,000 a's:
puts Benchmark.measure { 'a'*1_000_000 }

# First-time result of running line 7:
	# 0.000000   0.000000   0.000000 (  0.001388)

# Clarifying this in a table (times are measured in seconds):
	# user CPU time | system CPU time | user + system CPU times (sum) | elapsed real time
	# --------------+-----------------+-------------------------------+------------------
	#    0.000000   |   0.000000      |   0.000000                    |   0.001388

puts



# Set up a series of tests - run sequentially - using .bm:
n = 50000
Benchmark.bm do |x|
	# Each of these assigns the string '1' to the variable a 50,000 times:
	x.report { for i in 1..n; a = '1'; end }
	x.report { n.times do   ; a = '1'; end }
	x.report { 1.upto(n) do ; a = '1'; end }
end

puts

# Labels can be given to .report to modify the output for clarity:
Benchmark.bm do |x|
	x.report("for:  ") { for i in 1..n; a = '1'; end }
	x.report("times:") { n.times do   ; a = '1'; end }
	x.report("upto: ") { 1.upto(n) do ; a = '1'; end }
end

# Most of the time - not always - tests run through .bm with .report-labels (lines 35-37)
# take less time to calculate (by .01 seconds) than tests without .report-labels (lines 25-27).

# More observations (after running the code numerous times):
# .times and .for
	# seem to - most consistently - produce the lowest total evaluation times (0.01-0.02s)
# .for
	# never (visibly) appears to take any system time (0.00s)
	# seems to be on-par with .times in terms of total time (0.01-0.02s)
# .times
	# most often has less user time (0.01-0.02s) than .for, but somtimes has system time (0.00-0.01s)
	# seems to be on-par with .for in terms of total time (0.01-0.02s)
# .upto
	# very rarely takes any system time (0.00-0.01s)
	# almost consistently takes 0.02s user time (0.02s total time)

puts



# Creating a couple of hashes, the first with strings for keys...
string_az = Hash[("a".."z").to_a.zip((1..26).to_a)]
# ...the second having symbols for keys.
symbol_az = Hash[(:a..:z).to_a.zip((1..26).to_a)]

# Calculate how fast Ruby can find a key (as a string):
string_time = Benchmark.realtime do
	100_000.times { string_az["t"] }
end

# Calculate how fast Ruby can find a key (as a symbol):
symbol_time = Benchmark.realtime do
	100_000.times { symbol_az[:t] }
end

# On my present testing system...
puts "String time: #{string_time} seconds."
# ...takes approx. 0.049 - 0.054 seconds, and...
puts "Symbol time: #{symbol_time} seconds."
# ...takes approx. 0.022 - 0.026 seconds.

# In this case, finding the key/value pair based on symbols is about twice as fast
# as finding the same key/value pair based on strings.
