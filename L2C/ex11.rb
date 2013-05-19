print "How old are you? "
#get string  or gets automatically adds a line break at the end of the input. 
#chomp tells it to not include the line break.
#This returns our value inline when we use our put statement
age = gets.chomp()
print "How tall are you? "
height = gets.chomp()
print "How much do you weigh? "
weight = gets.chomp()

puts "So, you're #{age} years old, #{height} tall and #{weight} heavy."