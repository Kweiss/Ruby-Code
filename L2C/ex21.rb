def add(a, b)
	puts "Adding #{a} + #{b}"
	a + b
end

def substract(a, b)
	puts "Subtracting #{a} - #{b}"
	a - b
end

def multiply(a, b)
	puts "Multiplying #{a} * #{b}"
	a * b
end

def divide(a, b)
	puts "Dividing #{a} / #{b}"
	a / b 
end

puts "Let's do some math with just functions!"

age = add(30, 5)
height = substract(78, 4)
weight = multiply(90, 2)
iq = divide(320, 2)

puts "age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"

# A puzzle for extra credit, type it in anyway.
puts "Here is a puzzle"

what = add(age, substract(height, multiply(weight, divide(iq, 2))))

puts "That becomes #{what}. Can you do it by hand?"
