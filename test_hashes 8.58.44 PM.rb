# There are a variety of ways to create a new hash:

# Create and output an empty hash ( {} ):
hash1 = Hash.new
puts hash1

# Populate that hash with contents, in the form of key-value pairs:
hash1[:this_is_a_key] = "and this is that key\'s value"
puts hash1
puts hash1[:this_is_a_key]

# Note that array-keys (and their associated values) are called, and modified,
# in a similar manner as elements in an array (via square brackets: []).
puts



# Hashes can be given values upon creation as well:
# (and do not require calling Hash.new)
hash2 = { :a => 1, :b => 2 }
puts hash2

puts



# Another way of creating a hash, using a slightly different convention than on line 20:
hash3 = { b: 2, a: 1 }
# This ultimately results in { :b => 2, a: 1 }, but there's less typing up front.
puts hash3

puts



# Yet another way to create a key-value pair for a hash:
# The first item in the "array" is designated the key, and the second is the value for that key
hash4 = Hash[:tacos, 'delicious']
puts hash4

puts



# Expanding upon the above example, yet another way to create a hash - out of an array of arrays:
the_alphabet = Hash[('a'..'z').to_a.zip((1..26).to_a)]
puts the_alphabet

# Taking the creation one step at a time.
	# Create the alphabet as an array:
		# ('a'..'z').to_a
			# Result = [ 'a', 'b', 'c', etc... ]
	# Take each item in the aray, and make it it's own array, using:
		# .zip
			# Result = [ ['a'], ['b'], ['c'], etc... ]
	# Within the argument for .zip, another array is created - a list of the numbers 1-26:
		# (1..2).to_a
			# Result = [ 1, 2, 3, etc... ]
	# The array/range (1..26) is then associated with the array/range ('a'..'z'):
		# Result = [ ['a', 1], ['b', 2], ['c', 3], etc... ]
	# Each array within the array becomes a key-value pair:
		# the_alphabet = { "a" => 1, "b" => 2, "c" => 3, etc... }

puts



# Creating default values for a hash:
fowl = { chick1: "Cluck", chick2: "Cluck", rooster: "Cock-a-doodle-doo" }
fowl.default = "Nobody here but us chickens"

puts fowl[:chick1]
puts fowl[:chick2]
puts fowl[:rooster]

# Returns the default value when trying to call for a key-value pair that doesn't exist.
puts fowl[:sneaky_weasel]

# Note that the default value did not set a key-value pair - the hash remains unchanged:
puts fowl

puts



# Checking for equality across multiple hashes:

# Hashes are similar to arrays, in that they are lists of things.  However,
# in terms of equality checking, hashes compare the presence of keys and each
# key's value - as opposed to arrays, which compare values on a per-index basis.
array1 = [1, 2]
array2 = [2, 1]

# This results in false...
puts "[1,2] == [2,1]?"
puts array1 == array2
# ...because array1[0] is being compared against array2[0], etc...
puts

# However, for hashes, this results in true:
puts "{:b=>2,:a=>1} == {:a=>1,:b=>2}?"
puts hash2 == hash3
# ...because each hash is checked for a key :a with a value of 1,
# and a key :b with a value of 2 (which they both have)

puts



# Merging hashes:

# Beginning with a simple merge
hash1 = { a: 1, b: 2 }
hash2 = { c: 3 }
puts "hash1: #{hash1}"
puts "hash2: #{hash2}"

hash1.merge!(hash2)
puts "After merging, hash1: #{hash1}"
# hash2 is being merged into hash1, and anything that hash1
# does not have (that hash2 does) will be "given" to hash1

puts

# On a slightly more advanced note, if two hashes have a common key,
# the value of that key will be overwritten:
hash1 = { a: 1, b: 2 }
hash2 = { b: 3, c: 4 }
puts "hash1: #{hash1}"
puts "hash2: #{hash2}"

hash1.merge!(hash2)
puts "After merging, hash1: #{hash1}"
# Here, when hash2 was merged into hash1, Ruby saw that hash2's key :b
# had a different value than hash1's key :b.  Thus, when hash1 was called
# after the merge, :b had a value of 3 (hash2's value for :b).

puts
