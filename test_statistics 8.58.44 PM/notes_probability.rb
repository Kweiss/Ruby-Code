# Chapter 2 ("Probability"), page 29-31.
# Probability

# Defining Probability
	# Facts of probability:
		# 1. The probability of an event is always between 0 and 1.
		# 2. The probability of the sample space is always 1.
		# 3. The probability of an event and its complement is always 1.

	# Expanding upon number 3:
		# "This fact follows from the definition of a complement: everything in the sample space
		# that is not the event E is the complement of E, so E and ~E together must make up the
		# entire sample space and the probability of E and ~E together must equal 1."

	# Example:
		x = { :a => 50, :b => 30, :c => 10, :d => 10 }
		y = 100
		(x[:a] + x[:b] + x[:c] + x[:d]) == y

		# Say our event ('E') is x[:a]:
		x[:a] == 50

		# Everything that is not our event is ~E
		(x[:a]) + (x[:b] + x[:c] + x[:d]) == y

# Expressing the probability of an event:
	# For example, a 50% chance of an Event occurring:
		# P(E) = 0.5
		x[:a] = 50

	# First fact - the probability of an event (between 0 and 1) may be written as:
		# 0 <= P(E) <= 1
		z = 0

		z <= x[:a] && x[:a] <= y

	# Second fact - sample space S includes all possible outcomes of a trial:
		# P(S) = 1
		x[:a] + x[:b] + x[:c] + x[:d] == y

	# Third fact - the probability of event E and it's complement (~E) is always equal to 1:
		# P(E) + P(~E) = 1
		(x[:a]) + (x[:b] + x[:c] + x[:d]) == y

	# Therefore:
		# P(~E) = 1 - P(E) || P(E) = 1 - P(~E)
			# probability of an event not occurring is equal to 1 - the probability of the event occurring
				# AND/OR
			# probability of an event occurring is equal to 1 - the probability of the even not occurring

			(x[:b] + x[:c] + x[:d]) == y - x[:a]
				# OR
			x[:a] == y - (x[:b] + x[:c] + x[:d])

# Conditional Probabilities
	# Find the probability of some event's occurrence, based on another event's occurrence.
	# The following can be read as "The probability of E given F":
		# P(E|F)

	# F (above) is often referred to as "the condition" - the effect condition F has on the probability of event E.
	# Examples:
		# P(lung cancer | smoker)
		# P(lung cancer | non-smoker)

	# Conditional probability is an important concept in statistics because often we are trying to establish that
	# a factor has a relationship with an outcome, for instance that people who smoke cigarettes are more likely
	# to develop lung cancer. This would be expressed symbolically as:
		# P(lung cancer | smoker) > P(lung cancer | nonsmoker)
			# probability of lung cancer in smokers is greater than lung cancer in non-smokers

	# Conditional probabilities can also be used to define independence. Two variables are said to be independent
	# if the following relationship holds:
		# P(E|F) = P(E)
		
		# P(lung cancer | smoker) = P(lung cancer)
			# probability of lung cancer in smokers is equal to lung cancer in the general population

# Calculating the Probability of Multiple Events
	# To calculate the probability of any of several events occurring (the union of several events), add the probabilities
	# of the individual events.  The specific equation used will depend on whether the events are mutually exclusive
	# (cannot both occur) or not.

	# Union of mutually exclusive events
		# If the events are mutually exclusive, the equation is simply:
			# P(E ∪ F) = P(E) + P(F)

		# So imagine first a college that does not allow double majors.  We will define the events E = (English major)
		# as having a probability of 0.2, and F = (French major) as having a probability of 0.1.
			# P(E) = 0.2
			# P(F) = 0.1

		# These events are mutually exclusive because students are allowed only one major, so we would calculate the
		# probability of the event as:
			# P(E ∪ F) = 0.2 + 0.1 = 0.3

	# Union of events that are not mutually exclusive
		# To correct for the probability of two events both occurring, we use the following equation to calculate the
		# probability of either of two events that are not mutually exclusive:
			# P(E ∪ F) = P(E) + P(F) – P(E ∩ F)

		# Given P(English major) = 0.2, P(French major) = 0.1, and P(double major in French and English) = 0.05, the
		# probability of a student being either an English or a French major is:
			# P(E ∪ F) = 0.2 + 0.1 – 0.05 = 0.25

	# Intersection of independent events
		# To calculate the probability of all of several events occurring (the intersection of several events),
		# multiply their individual probabilities.  The specific formula used depends on whether the events
		# are independent or not.
		
		# If they are independent, the probability of both E and F is:
			# P(E ∩ F) = P(E) × P(F)

		# For instance, if we are flipping a coin twice, so E = (heads on first flip) and F = (heads on second
		# flip), both trials are independent. If the probability of heads is 0.5, we can compute the
		# probability (heads on both flips) as:
			# P(E ∩ F) = 0.5 * 0.5 = 0.25

	# Intersection of nonindependent events
		# If two events are not independent, we have to know their conditional probability in order to be able
		# to calculate the probability of both occurring:
			# P(E ∩ F) = P(E) * P(F|E)

		# For instance, if we are drawing two cards without replacement from a standard deck of 52, those
		# events are not independent because the probability for the second draw depends on the result of the
		# first draw.  If we are interested in the probability of drawing two black cards, we can calculate
		# this using the information that the probability E = (first card black) is 26/52 or 0.5, and the
		# conditional probability F|E = P(second card black|first card black) is 25/51 or 0.49. Therefore,
		# the probability that both cards are black is:
			# P(E ∩ F) = 0.5 × 0.49 = 0.245
