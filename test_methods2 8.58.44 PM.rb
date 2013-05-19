# Practice various other methods, mathematical whatnot on 3/3/2013

def is_prime(number_in_question)
	# Prime numbers, as defined on Wikipedia:
		# 1. A number greater than 1
		# 2. Has NO positive divisors other than 1 and itself

		if number_in_question <= 1
			puts "InputError: Number cannot be 1 or less."
		else
			i = 2
			other_divisors = []
			while i < number_in_question
				if ((number_in_question % i)) == 0
					other_divisors << i
				end
				i += 1
			end

			if other_divisors.size == 0
				puts "#{number_in_question} is a prime number"
			else
				puts "#{number_in_question} is not a prime number; other divisors include:"
				puts other_divisors.join(', ')
			end
		end

end

puts is_prime(1)
puts is_prime(2)
puts is_prime(3)
puts is_prime(4)
puts is_prime(5)
puts is_prime(6)
puts is_prime(7)
puts is_prime(8)
puts is_prime(9)
puts is_prime(10)

puts





def pow(base, exponent)
	result = 1

	i = 1
	while i <= exponent
		result *= base
		i += 1
	end

	result
end

puts pow(2,2)
puts pow(3,3)
puts pow(4,4)
puts pow(5,5)
puts pow(6,6)

puts





def sum(this_array)
	sum = 0

	this_array.each do |this_number|
		sum += this_number
	end

	sum
end

p sum([1,2,3]) # 6
p sum([4,5,6,7]) # 22
p sum([8,2,5,5,15]) # 35

puts





# 10m
def silly_sum(this_array)
	i = 0
	total = 0

	this_array.each do |this_num|
		total += (this_num * i)
		i += 1
	end

	return total
end

puts silly_sum([2, 3]) # 3
puts silly_sum([2, 3, 4]) # 11

puts





# 15m
def num_squares(max_num)
	i = 1
	squares = []

	until i == max_num
		if ((i * i) < max_num)
			squares << (i * i)
		end
		i += 1
	end

	return squares
end

puts num_squares(5).join(', ')
puts num_squares(10).join(', ')
puts num_squares(25).join(', ')
puts num_squares(50).join(', ')

puts





# 7m
def silly_nums(max_num)
	i = 0
	list_of_valid_nums = []

	until i == max_num
		if (i % 3 == 0) || (i % 5 == 0)
			if (i % 3 == 0) && (i % 5 == 0)
			else
				list_of_valid_nums << i
			end
		end

		i += 1
	end

	list_of_valid_nums
end

puts silly_nums(3).join(', ')
puts silly_nums(10).join(', ')
puts silly_nums(20).join(', ')
