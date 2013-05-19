class PersonalChef
	def make_toast(color)
		if color.nil?
			puts "I am sorry, but I dont know what color to make your toast"
		else
			puts "Making your Toast #{color}"
		end
		
		return self
	end

	def make_milkshake(flavor)
		puts "Making your amazing #{flavor} milkshake!"
		return self
	end

	def make_eggs(quantity)
		quantity.times do
			puts "Making an egg. This is egg number #{quantity}."	
		end
		puts "I'm Done!"
		return self
	end
	def good_morning(today, day_of_year, year)
		today = Date.today.strftime("%A")
		day_of_year = Date.today.yday
		year = Date.today.year

		puts "Happy #{today}! it is the #{day_of_year} of #{year}!"
		return self
	end

	def gameplan(meals)
  		meals.each do |meal|
    		puts "We'll have #{meal}..."
  		end

  		all_meals = meals.join(", ")
  		puts "In summary: #{all_meals}"
	end

	def inventory
		produce = {apples: 3, oranges: 1, carrots: 4}
		produce.each do |item, quantity|
			puts "There are #{quantity} #{item} in the fridge"
		end
	end

	def water_status(minutes)
		if minutes < 7
			puts "The water is not boiling yet."
		elsif minutes == 7
			puts "It's just barely boiling."
		elsif minutes == 8
			puts "It's boiling!"
		else
			puts "Hot! Hot! Hot!"
			return self
		end
	end

	def countdown(counter)
		while counter > 0
			puts "The counter is #{counter}"
			counter = counter - 1
		end
		return self
			
	end


end

class Butler
	def open_door(door)
		puts "Opening the #{door} door, sir."
		
	end
end


