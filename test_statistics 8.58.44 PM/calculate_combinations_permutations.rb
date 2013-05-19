require_relative 'lib/calculate_factorial'

# Chapter 2 ("Probability"), page 27.
# Permutations: all the possible ways elements in a set can be arranged.
def calc_permutations(var)
	possible_permutations = []
	permutations = CalculateFactorial.new(var.size).factorial

	until possible_permutations.size == permutations
		this_permutation = var.shuffle

		possible_permutations << this_permutation unless possible_permutations.include?(this_permutation)
	end

	possible_permutations.each do |permutation|
		puts permutation.join(', ')
	end
end

calc_permutations([1, 2, 3])
puts

calc_permutations(["a", "b", "c", "d"])
puts



# Chapter 2 ("Probability"), page 28.
# Combinations:
	# "Combinations are similar to permutations, with the difference that the order of elements
	# is not significant in combinations: (a, b, c) is the same combination as (b, a, c).
	# For this reason there is only one combination of the set (a, b, c)."

def calc_combinations(var, pair_size)
	possible_combinations = []
	# "The number of permutations of subsets of size k drawn from a set of size n is calculated as:"
		# nPk = n! / (n – k)!
	permutations = CalculateFactorial.new(var.size).factorial / CalculateFactorial.new(var.size - pair_size).factorial

	# "...the formula for a combination, which is the formula for the permutation divided by the
	# factorial of the number of objects selected:"
		# nCk = nPk / k!
	combinations = permutations / CalculateFactorial.new(pair_size).factorial

	until possible_combinations.size == combinations
		this_combination = {}

		2.times do
			this_sample = var.sample
			this_combination[this_sample.to_sym] = this_sample
		end

		possible_combinations << this_combination if (this_combination.size == 2 && possible_combinations.include?(this_combination) == false)
	end

	possible_combinations.each do |combination|
		puts combination.keys.join(', ')
	end
end

calc_combinations(['a', 'b', 'c'], 2)
puts
