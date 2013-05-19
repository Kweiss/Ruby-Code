class Extract
	def extract_content(line)
		line = line.split # Convert the line to an array
		
		2.times { line.delete(line[0]) } # Remove the first two useless lines

		# Put an empty space between each item in the array
		placeholder = line
		line = []

		placeholder.each { |i| line << i << " " }

		line.pop # Remove excess empty space

		line[0] = line[0].split("") # Convert line[0] to an array, splitting each character to an item

		9.times { line[0].shift } # Remove "content=\"

		line[0] = line[0].join("") # Convert line[0] back into a string

		line[-1] = line[-1].split("") # Convert line[-1] to an array, splitting each character to an item

		2.times { line[-1].pop } # Remove "">"

		line[-1] = line[-1].join("") # Convert line[-1] back into a string

		line = line.join # Convert the array to a string
	end

	def extract_likes(line)
		before_changes = line # Create a copy of line to use for later

		line = line.split # Convert the line to an array

		line.shift # Remove unneeded 0th index

		line[0] = line[0].split("") # Convert line[-1] to an array, splitting each character to an item

		# Remove class="..." content
		20.times { line[0].shift } if before_changes.include?('class="likes-count"')
		23.times { line[0].shift } if before_changes.include?('class="dislikes-count"')

		7.times { line[0].pop } # Remove </span> tag

		line = line[0].join.to_i
	end

	def extract_views(line)
		line = line.split("") # Convert the line to an array, splitting each character to an item

		4.times { line.shift } # Remove 4 preceeding empty spaces

		7.times { line.pop } # Remove " views"

		line[0].to_i
	end
end
