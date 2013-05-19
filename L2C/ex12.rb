require 'open-uri'

open("http://ruby-lang.org/en") do |foo|
	foo.each_line {|line| p line}
	puts foo.base_uri 		# <URI::HTTP:0x40e6efoo2 URL:http://ruby-lang.org/en>
	puts foo.content_type 	# "text/html"
	puts foo.charset			# "iso-88859-1"
	puts foo.content_encoding	# []
	puts foo.last_modified	# Some date

end
