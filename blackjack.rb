#Black Jack game...

puts "Welcome to the table!\nHere come your cards:"

#give us two cards each
player_card_1 = rand(10)+1
player_card_2 = rand(10)+1

dealer_card_1 = rand(10)+1
dealer_card_2 = rand(10)+1

#sum up our total hand
player_hand = player_card_1 + player_card_2
dealer_hand = dealer_card_1 + dealer_card_2

if dealer_card_1  == 11 and dealer_hand > 21
	dealer_hand -= 10	
end
if dealer_card_2  == 11 and dealer_hand > 21
	dealer_hand -= 10	
end

# p "#{player_hand} and d: #{dealer_hand}"
#run the game while neither the dealer or player have blackjack
while player_hand < 22 or dealer_hand < 22
	#p "#{player_hand} and  d: #{dealer_hand} in the whie"

	if dealer_hand == 21
		puts "Dealer has blackjack, you lose!"
		exit 0

	elsif player_hand == 21
		puts "You have Blackjack! \nLet's get you paid!"
		exit 0

	elsif dealer_hand < 16
		dealer_hand += (rand(10) + 1)
		#puts "should have added to the dealer hand"
		# puts "added a card to dealer, he was under 16 adn now has: #{dealer_hand}"

	else
		puts "Looks like you have #{player_hand} total"
		#p "dealer has #{dealer_hand}"
		puts "Do you want to hit?"
		hit = gets.chomp()

		if hit == "y"
			player_hand += (rand(10) + 1)
			if player_hand > 21
				puts "You have #{player_hand}. You bust, nuts!"
				exit 0
			end			

		elsif dealer_hand > 21
			puts "The dealer bust, yahoo!"
			exit 0

		elsif player_hand > dealer_hand
			puts "Dealer has #{dealer_hand}. You win!"
			exit 0

		else
			puts "Dealer has #{dealer_hand}. Dealer wins... better luck next time"
			exit 0		
				
		end
	end
end
