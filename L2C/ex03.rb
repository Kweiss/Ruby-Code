puts "I will now count my chickens:"

# Diviedes 30 by 6 then adds 25 (PEMDAS) - result:  30
puts "Hens", 25+30 / 6

#  Multiply 25 by 3, The does the 4 modulo (I dont know what this means... positive and even checks?) and returns 3... then subtracts 100 by 3 to end in 97.
puts "Roosters", 100-25 * 3 % 4

puts "Now I will count the eggs:" 

# Mod 2 : odd number returns a 1 and even returns a zero (when % 2 is used)   
# This first divides 1/4 and returns zero (using integers... we need a float to hold the decimal)
# Then does the 4 mod 2 and returns 0, then adds and subtracts across
# 3 + 2 + 1 - 5 + 0 - 0 + 6    =    6 - 5 + 6   =   7
puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

puts "This is true that 3 + 2 < 5 -7?"

# Do math, then evaluate 5 < - 2
puts 3 + 2 < 5 - 7

puts "What is 3 + 2?", 3 + 2
puts "What is 5 - 7?", 5 - 7

puts "Oh, That's why it's false."

puts "How about some more."

# you know these evaluations
puts "Is it greater?", 5> -2
puts "Is it greater or equal?", 5 >= -2
puts "Is it less or equal?", 5 <= -2
