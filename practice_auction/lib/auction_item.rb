class AuctionItem
	def initialize(item_name, starting_bid)
		@item_name = item_name
		@starting_bid = starting_bid

		@current_top_bid = 0
		@bid_history = []
	end

	def call_current_item
		puts "#{@item_name}"
		puts "  Starting bid: #{@starting_bid}"
		puts "  Current bid:  #{@current_top_bid}"
	end

	def call_item_name
		@item_name
	end

	def call_starting_bid
		@starting_bid
	end

	def call_current_top_bid
		@current_top_bid
	end

	# call_history now takes optional arguments
	def call_history(*indices)
		if indices == [] # without the optional arguments...
			@bid_history # ...ruby will return the full history
		else # but with the right optional arguments...
			@bid_history[indices[0]][indices[1]] # ...specific elements within @bid_history can be requested
		end
	end

	def add_bid(bid)
		this_bid = bid

		if this_bid[0] > @current_top_bid
			@bid_history << this_bid

			@current_top_bid = this_bid[0]
		else
			puts "Bid rejected: your bid of #{this_bid[0]} is not greater than the current top bid of #{@current_top_bid}."
		end

	end
end
