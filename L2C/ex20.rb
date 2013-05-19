input_file = ARGV[0]

def print_all(f)
	puts f.read()
end

def rewind(f)
	f.seek(0, IO::SEEK_SET)
end

def print_a_line(line_count, f)
	puts "#{line_count} #{f.readline()}"
end

current_file = File.open(input_file)

puts "First let's print the whole file:\n"
print_all(current_file)
puts "\nNow let's rewind, kind of like a tape"

rewind(current_file)

puts "Let's print three lines:"

current_line = 1

while current_line < 4
	print_a_line(current_line, current_file)
	current_line +=1	
end

# current_line += 1
# print_a_line(current_line, current_file)

# current_line += 1
# print_a_line(current_line, current_file)