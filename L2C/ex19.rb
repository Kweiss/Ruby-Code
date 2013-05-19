# defines our function and outputs the paramters we give it
def cheese_and_crackers(cheese_count, boxes_of_crackers)
	puts "You have #{cheese_count} cheeses!"
	puts "You have #{boxes_of_crackers} boxes of crackers!"
	puts "Man that's enough for a party!"
	puts "Get a blanket."
	puts # A blank line
end

# calls our function with the nubmes hardcoded
puts "We can just give the function numbers directly:"
cheese_and_crackers(20,30)

# calls the function using hardcoded variables
puts "Or, we can use variables from our script:"
amount_of_cheese = 10
amount_of_crackers = 50
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

# calls the function using math inside the hardcoded number definition
puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

#call the function with variables and math in the function paramters.
puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)
