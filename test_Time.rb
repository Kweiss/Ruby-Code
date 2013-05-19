# play around with some of the features of Time

# we can get the time of the moment Time.now is called
right_now = Time.now
# puts result (below) will vary depending on when/where the above was called
puts right_now

# regardless of the actual date/time, the format should look like:
	# 2013-03-08 15:34:32 -0800

# from left to right, that is:
	# year, month, day, hour (24-hour clock), minute, second, zone

# converting right_now to an array...
right_now = right_now.to_a
puts "#{right_now}"

# ...will result in:
	# [32, 34, 15, 8, 3, 2013, 5, 67, false, "PST"]

# from left to right (index 0 => index 9), that is:
	# second, minute, hour (24-hour clock), day, month, year, wday, yday, isdst, zone
	#    0      1       2                    3     4      5    6     7      8      9
	
	# weekday ('wday' - index 6) represents the day of the week as an integer
		# note that weekdays are not numbered similarly to months (see Notes On Numbered Months/Days, below)
	
	# year-day ('yday' - index 7) represents the x'th day of the year

	# is-daylight-savings-time ('isdst' - index 8)
		# this will return true if time occurs during Daylight Saving Time in its time zone


	# Notes On Numbered Days/Months
		# Months are numbered as such:

		# months = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July",
		#            8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December" }

		# The month will represented as an integer; in this case, 3 for the month of March; you would see 7 for July,
		# 9 for September or 12 for December, for example.



		# Days, on the other hand...

		# days = { 0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday",
		#          4 => "Thursday", 5 => "Friday", 6 => "Saturday" }
		
		# Days are numbered starting at 0 (as if indices in an array) for Sunday, through 6 for Saturday
