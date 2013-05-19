# Refer to the following for other info:
# http://www.juretta.com/log/2006/08/13/ruby_net_http_and_open-uri/

require 'open-uri'
require 'pp'

require_relative 'lib/extract_content'

open('http://www.youtube.com/watch?v=PAc6K8U8dcI') do |f|
	@read_line = false

	f.each do |line|
		@title    = Extract.new.extract_content(line) if line.include?('og:title')
		@url      = Extract.new.extract_content(line) if line.include?('og:url')
		@likes    = Extract.new.extract_likes(line)   if line.include?('class="likes-count"')
		@dislikes = Extract.new.extract_likes(line)   if line.include?('class="dislikes-count"')

		if line.include?('class="watch-view-count "') || @read_line == true
			if @read_line == true
				@views = Extract.new.extract_views(line)
				@read_line = false
			else
				@read_line = true
			end
		end

		break if (!@title.nil?) && (!@url.nil?) && (!@likes.nil?) && (!@dislikes.nil?) && (!@views.nil?)
	end

	puts
	puts "Title:	#{@title}"
	puts "URL:	#{@url}"
	puts "	Views - #{@views} / Likes - #{@likes} / Dislikes - #{@dislikes}"
	puts



	# no = 1
	# # print the first three lines
	# f.each do |line|
	# 	print "#{no}: #{line}"
	# 	no += 1
	# 	# break if no > 4
	# end
end
