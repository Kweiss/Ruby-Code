# The conditional assignment operator...
	# ||=
# ...will assign a value to a variable, if that variable does not already have a value.

# As in this example:
	# x ||= y
# In the above, '||=' is a shorthand way of saying "assign y value to variable x, IF x does
# not already have a value - either through non-existence, or having the 'value' of nil."

# The below would return an error, if it is called:
# puts x

# If nil is assigned to x, then try to output it, nothing should show:
x = nil
puts x

puts

# The conditional assignment operator assigns 5 to x:
x ||= 5
puts x

puts

# x will not output 20, because x already has a value:
x ||= 20
puts x
