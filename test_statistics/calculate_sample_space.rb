# Chapter 2 ("Probability"), page 24.
# Sample Space: set of all possible elementary outcomes of a trial.
coin = ['heads', 'tails']
dice = (1..6).to_a

# Calculate all possible outcomes: find the number of possible outcomes by using the fundamental counting principle.
# The Fundamental counting Principle is:
	# "If a process requires 2 actions and the 1st action can be done in x ways and the
	# 2nd action can be done in y ways, then the process can be done in x*y ways".

def all_possible_outcomes_of_multiple_trials(var, trials)
	possible_outcomes = []

	until possible_outcomes.size == (var.size ** trials)
		this_outcome = []

		trials.times do
			this_outcome << var.sample
		end

		possible_outcomes << this_outcome unless possible_outcomes.include?(this_outcome)
	end

	possible_outcomes.each do |outcome|
		puts outcome.join(', ')
	end
end

# "If the experiment consists of multiple trials, all possible combinations of outcomes of the trials must be
# specified as part of the sample space.  For instance, if the trial consists of flipping a coin twice..."
all_possible_outcomes_of_multiple_trials(coin, 2) # 4 possible outcomes (2 ** 2)
puts 

# ...and if each trial were to consist of three coin-flips:

all_possible_outcomes_of_multiple_trials(coin, 3) # 8 possible outcomes (2 ** 3)
puts

# All possible coutcomes from rolling a dice once:
all_possible_outcomes_of_multiple_trials(dice, 1) # 6 possible outcomes (6 ** 1)
puts

# All possible outcomes from rolling a dice twice (per trial):
all_possible_outcomes_of_multiple_trials(dice, 2) # 36 possible outcomes (6 ** 2)
puts



# Alternative method definition; calculate all possible outcomes based on numerous varibles with various values:
def all_possible_combinations_of_multiple_value_variables(var)
	possible_combinations = []
	combinations = 1

	var.each do |list|
		combinations *= list.size
	end

	until possible_combinations.size == combinations
		this_combination = []

		var.each do |list|
			this_combination << list.sample
		end

		possible_combinations << this_combination unless possible_combinations.include?(this_combination)
	end

	possible_combinations.each do |combination|
		puts combination.join(', ')
	end
end

# Consider a restaurant, which serves a variety of main/side dishes, beverages and deserts:
restaurant_menu = [ ["burger", "steak"],
										["soup", "salad", "fries"],
										["water", "iced tea", "soda"],
										["ice-cream float", "brownie"] ]

# How many menu combinations are possible?
all_possible_combinations_of_multiple_value_variables(restaurant_menu) # 36
puts

# Consider the someone's wardrobe: one top, one bottom, and one pair of shoes:
dorothys_wardrobe = [ ["pink shirt", "orange shirt", "plaid button-down"],
											["denim jeans", "long skirt"],
											["sneakers", "ruby slippers"] ]

all_possible_combinations_of_multiple_value_variables(dorothys_wardrobe) # 12
puts
