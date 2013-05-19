# Practice methods w/ optional arguments

def do_some_matherings(x, y, *z)
	@x = x
	@y = y
	@z = z[0]

	if @y != nil
		puts "For x and y:"
		puts "  #{@x + @y}"
		puts "  #{@x * @y}"
	else
		puts "For x and z:"
		puts "  #{@x + @z}"
		puts "  #{@x * @z}"
	end
end

do_some_matherings(5, 5)

puts

do_some_matherings(5, nil, 0)
# *z is not really 0, but an array: [0]

puts



def more_math(operator, start, *optional_args)
	@total = start

	if optional_args == []

	else
		if operator == "add"
			optional_args.each do |i|
				@total += i
			end
		elsif operator == "multiply"
			optional_args.each do |i|
				@total *= i
			end
		end
	end

	return @total
end

# since optional arguments become arrays, numerous arguments beyond the x'th (where x is the optional argument)
# are all a part of the option argument array

puts more_math("add", 10) # program does nothing with no optional arguments
puts more_math("multiply", 10) # program does nothing with no optional arguments
puts more_math("add", 0, 5) # optional_args == [5]
puts more_math("add", 0, 5, 10) # optional_args == [5, 10]
puts more_math("add", 0, 5, 10, 15) # optional_args == [5, 10, 15]
puts more_math("multiply", 1, 5) # optional_args == [5]
puts more_math("multiply", 1, 5, 10) # optional_args == [5, 10]
puts more_math("multiply", 1, 5, 10, 15) # optional_args == [5, 10, 15]

puts
