#takes teh rguments we pass (file name) and assigns them to the filename string value
filename = ARGV.first

#creates a string value with >> in it
prompt = ">>"
#defines the txt object with the file open command, and uses the filename argument from the first run as the parameters
txt = File.open(filename)

#puts the line and the file name
puts "Here is your file: #{filename}"
#outputs the contents, or morespecifically, what it read from the file
puts txt.read()
txt.close()

#new puts line
puts "I'll also ask you to type it again:"
#print the prompt string
print prompt
#creates a string object and sets the value to the input received from the STDIN
file_again = STDIN.gets.chomp()

#opens the new file
text_again = File.open(file_again)

#outputs the new text
puts text_again.read()

text_again.close()
