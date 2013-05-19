# RubyWarrior - Level 1
# class Player
# 	def play_turn(warrior)
	
# 		def walk(warrior)
# 			warrior.walk!
# 		end

# 		walk(warrior)
# 	end
# end



# RubyWarrior - Level 2
# class Player
# 	def play_turn(warrior)
	
# 		def walk(warrior)
# 			warrior.walk!
# 		end

# 		def feel(warrior)
# 			warrior.feel.empty?
# 		end

# 		def attack(warrior)
# 			warrior.attack!
# 		end

# 		if feel(warrior)
# 			walk(warrior)
# 		else
# 			attack(warrior)
# 		end

# 	end
# end



# # RubyWarrior - Level 3
# class Player
# 	def play_turn(warrior)
	
# 		def walk(warrior)
# 			warrior.walk!
# 		end

# 		def feel(warrior)
# 			warrior.feel.empty?
# 		end

# 		def attack(warrior)
# 			warrior.attack!
# 		end

# 		def check_health(warrior)
# 			warrior.health
# 		end

# 		def rest(warrior)
# 			warrior.rest!
# 		end

# 		if feel(warrior)
# 			# using...
# 			# if check_health(warrior) < 20
# 			# ...is probably safer, but results in a level score of 61 (time bonus of 3)

# 			# but using...
# 			if check_health(warrior) < 8
# 				# results in a level score of 68 (time bonus of 9)
# 				rest(warrior)
# 			else
# 				walk(warrior)
# 			end
# 		else
# 			attack(warrior)
# 		end

# 	end
# end



# # RubyWarrior - Level 4
# class Player
# 	def initialize
# 		@health = 20
# 	end

# 	def play_turn(warrior)
	
# 		def walk(warrior)
# 			warrior.walk!
# 		end

# 		def feel(warrior)
# 			warrior.feel.empty?
# 		end

# 		def attack(warrior)
# 			warrior.attack!
# 		end

# 		def check_health(warrior)
# 			warrior.health
# 		end

# 		def rest(warrior)
# 			warrior.rest!
# 		end

# 		if check_health(warrior) < 12
# 			if check_health(warrior) < @health
# 				if feel(warrior)
# 					walk(warrior)
# 				else
# 					attack(warrior)
# 				end
# 			else
# 				rest(warrior)
# 			end
# 		else
# 			if feel(warrior)
# 				walk(warrior)
# 			else
# 				attack(warrior)
# 			end
# 		end

# 		@health = check_health(warrior)

# 	end
# end



# RubyWarrior - Level 5
# class Player
# 	def initialize
# 		@health = 20
# 	end

# 	def play_turn(warrior)
	
# 		def walk(warrior)
# 			warrior.walk!
# 		end

# 		def feel(warrior, *captive)
# 			if captive[0] == nil
# 				warrior.feel.empty?
# 			else
# 				warrior.feel.captive?
# 			end
# 		end

# 		def attack(warrior)
# 			warrior.attack!
# 		end

# 		def check_health(warrior)
# 			warrior.health
# 		end

# 		def rest(warrior)
# 			warrior.rest!
# 		end

# 		def rescue_captive(warrior)
# 			warrior.rescue!
# 		end

# 		if check_health(warrior) < 13
# 			if check_health(warrior) < @health
# 				if feel(warrior)
# 					walk(warrior)
# 				else
# 					if feel(warrior, "captive")
# 						rescue_captive(warrior)
# 					else
# 						attack(warrior)
# 					end
# 				end
# 			else
# 				rest(warrior)
# 			end
# 		else
# 			if feel(warrior)
# 				walk(warrior)
# 			else
# 				if feel(warrior, "captive")
# 					rescue_captive(warrior)
# 				else
# 					attack(warrior)
# 				end
# 			end
# 		end

# 		@health = check_health(warrior)

# 	end
# end



# RubyWarrior - Level 6
class Player
	def initialize
		@health = 20
	end

	def play_turn(warrior)
	
		def walk(warrior)
			warrior.walk!
		end

		def feel(warrior, *captive)
			if captive[0] == nil
				warrior.feel.empty?
			else
				warrior.feel.captive?
			end
		end

		def attack(warrior)
			warrior.attack!
		end

		def check_health(warrior)
			warrior.health
		end

		def rest(warrior)
			warrior.rest!
		end

		def rescue_captive(warrior)
			warrior.rescue!
		end

		if check_health(warrior) < 20
			if check_health(warrior) < @health
				if feel(warrior)
					walk(warrior)
				else
					if feel(warrior, "captive")
						rescue_captive(warrior)
					else
						attack(warrior)
					end
				end
			else
				rest(warrior)
			end
		else
			if feel(warrior)
				walk(warrior)
			else
				if feel(warrior, "captive")
					rescue_captive(warrior)
				else
					attack(warrior)
				end
			end
		end

		@health = check_health(warrior)

	end
end
