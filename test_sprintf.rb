# Generate a random, 27-character float (1 number + . + 25 decimal places):
def generate_random_float
	some_float = "#{rand(10)}" + "."

	25.times do
		some_num = rand(10)

		some_float += some_num.to_s
	end

	return some_float.to_f
end

def limit_decimals(random_float, num)
	sprintf "%.#{num}f", random_float
end

random_float = generate_random_float

puts "The following random float was generated: #{random_float}"
puts "How many decimal places would you like to keep?"
puts "Enter an integer between 1-10:"

user_num = gets.chomp.to_i
puts

puts limit_decimals(random_float, user_num)
