def counter(i)

	puts "How long should we go for?"
	till = gets.to_i

	numbers = []

	for foo in (i..till)
	
		puts "At the top i is #{foo}"
		numbers.push(i)

		puts "Numbers now: #{numbers}"
		puts "At the bottom i is #{foo}"
	end

	for any_variable_I_Iterate_through in numbers
		puts any_variable_I_Iterate_through
	end
end


counter(2)

