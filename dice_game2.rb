# Introduction:
puts "Welcome to the dice game!  You roll two dice - as long as they are not doubles,"
puts "their values are added together, and you keep a running score.  But rolling a "
puts "double resets your score to 0 and ends the game.  See how long you can go!"

puts "\n Let's start off by getting your name"
name = gets.chomp()

# Resets running_score and play at the start of each new game:
# Also, other variables:
running_score = 0
play = 1
farewell = "Another time, perhaps.  Take care!"

# The game begins, and keeps a running total of the score
while play
	# The dice are cast:
	dice1 = rand(6) + 1
	dice2 = rand(6) + 1

	# Scoring:
	if dice1 != dice2
		running_score += (dice1 + dice2)
		puts "You rolled a #{dice1} and a #{dice2} and your running score is #{running_score}!"
		puts "Roll again (y/n)?"
		if gets.chomp == "y"

		else
			puts farewell
			exit 0
		end
	
	elsif dice1 == dice2 && name == "Kyle"
		running_score += (dice1 + dice2)
		puts "Hey Kyle, We like you... looks like the dice match (you rolled a #{dice1} and #{dice2}, but dont tell anyone, cheat mode enabled for you!"
		puts "Your score is now: #{running_score}"
		puts "Roll again (y/n)?"
		if gets.chomp == "y"

		else
			puts farewell
			exit 0
		end

	# But if any doubles are rolled, the running_score is reset to 0
	# The game is over, and they player may play again if they'd like
	else name != "Kyle"
		running_score = 0
		puts "Aw, you rolled a double-#{dice1} - your running score is now 0."
		puts "Play again?"
		if gets.chomp == "y"
		else
			puts farewell
			exit 0
		end
	end
end