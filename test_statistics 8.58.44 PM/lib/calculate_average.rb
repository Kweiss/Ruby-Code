# Calculate the average of a set of numbers
class Average
	def initialize(array)
		@array = array
	end

	def calc_avg
		@array.inject { |sum, i| sum + i }.to_f / @array.size
	end
end
