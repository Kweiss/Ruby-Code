# http://www.mathsisfun.com/data/standard-deviation.html
	# The Standard Deviation is a measure of how spread out numbers are.
	# The formula is easy: it is the square root of the Variance. So now you ask, "What is the Variance?"

	# The variance is the average of the squared differences from the Mean.
	# To calculate the variance follow these steps:
		# Work out the Mean (the simple average of the numbers)
		# Then for each number: subtract the Mean and square the result (the squared difference).
		# Then work out the average of those squared differences.

require_relative 'calculate_mean'

class StandardDeviation

	def calc_std_dev(array, spcf_dcml=2)
		# Step 1 - find the mean of all the numbers
		this_mean = (sprintf "%.#{spcf_dcml}f", CalculateMean.new(array).mean).to_f

		# Step 2 - for each num in array, subtract this_mean - this is the deviation.
		# Then, square the deviation.
		i = 0
			array.each do |num|
				array[i] = (num - this_mean) ** 2
			i += 1
		end

		# Step 3 - calculate the mean of the modified numbers.
		variance = (sprintf "%.#{spcf_dcml}f", CalculateMean.new(array).mean).to_f

		# The Standard Deviation is, at this point, the square root of the variance:
		standard_deviation = Math.sqrt(variance)

		# Round to specified decimal places (2, by default, if spcf_dcml is not specified)
		(sprintf "%.#{spcf_dcml}f", standard_deviation).to_f
	end

	# Calculate the standard deviation of the standard deviations (yo, dawg...) of multiple arrays:
	def variance_of_variances(array_of_arrays)
		# Create an empty placeholder, in which the standard deviations of each array will be put
		std_devs_of_arrays = []

		# For each array in array_of_arrays...
		array_of_arrays.each do |this_array|
			# ...populate std_devs_of_arrays with the standard deviation of that array.
			std_devs_of_arrays << calc_std_dev(this_array)
		end

		# Finally, calculate the standard deviation of the standard deviations:
		calc_std_dev(std_devs_of_arrays)
	end

end
