# Calculate the mean of a series of numbers
class CalculateMean
	def initialize(ary, population="population")
		@series_of_nums = ary
		@pop = "population"
	end

	def mean
		sum = 0
		# Add together the sum of all numbers in the set
		@series_of_nums.each { |x| sum += x }

		# If @series_of_nums is the full population:
			# mean = sum / @series_of_nums.size
		if @pop == "population"
			( sum / @series_of_nums.size ).to_f

		# Otherwise, if @series_of_nums is a sample size of a much larger population:
			# mean = sum / @series_of_nums.size - 1
		elsif @pop == "sample"
			( sum / @series_of_nums.size - 1 ).to_f
		end
	end
end
