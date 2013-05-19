# Calculate the median of a set of numbers
class Median
	def initialize(ary)
		@ary = ary.sort
	end

	def median
		if @ary.size % 2 != 0
			# If @ary.size is odd, the median is the middle number
			@ary[@ary.size / 2]
		else
			# If @ary.size is even, the median is halfway between the two middle numbers
			(@ary[@ary.size / 2 - 1] + @ary[@ary.size / 2]) / 2.0
		end
	end
end
