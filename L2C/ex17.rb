from_file, to_file = ARGV
#script = $0

#we could do these two on one line too, how?
#input = File.open(from_file)
indata = File.read(File.open(from_file))

puts "Copying the #{indata.length} byte(s) file: #{from_file} to: #{to_file}"

if File.exists? to_file
	puts "The file already exists, are you sure you want to continue (y/n)?"
	answer = STDIN.gets.chomp()
	if answer != "y"
			puts "Aborting operation and exiting application."
			exit!
	end
	
end

#output = File.open(to_file, 'w')
File.open(to_file, 'w').write(indata)

puts "Alright, all done."

#output.close()