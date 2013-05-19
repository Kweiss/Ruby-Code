# Calculate factorials
class CalculateFactorial
	def initialize(num)
		@num = num
	end

	def factorial
		total = 1

		until @num == 1
			total *= @num
			@num -= 1
		end

		return total
	end
end
