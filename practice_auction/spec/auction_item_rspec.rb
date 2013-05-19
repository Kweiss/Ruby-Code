require_relative '../lib/auction_item'

describe AuctionItem do
	let(:green_chair_auction) { AuctionItem.new("Green Chair", 475) }

	describe "once created and defined," do
		it "should have a name" do
			green_chair_auction.call_item_name.should == "Green Chair"
		end
		it "should have a starting bid" do
			green_chair_auction.call_starting_bid.should == 475
		end
		it "should have no top bid" do
			green_chair_auction.call_current_top_bid.should == 0
		end
		it "should not have any history" do
			green_chair_auction.call_history.should == []
		end
	end

	describe "adding a bid" do
		before do
			@time_of_bid1 = Time.now
			green_chair_auction.add_bid([500, @time_of_bid1])
		end

		it "should have a top bid of 500" do
			green_chair_auction.call_current_top_bid.should == 500
		end

		it "should have a timecode, and associate the bid with the timecode" do
			green_chair_auction.call_history.should == [[500, @time_of_bid1]]

			green_chair_auction.call_history(0, 0).should == 500
			green_chair_auction.call_history(0, 1).should == @time_of_bid1
		end

		describe "adding a bid after adding a bid (yo, dawg...!)" do
			before do
				@time_of_bid2 = Time.now
				green_chair_auction.add_bid([600, @time_of_bid2])
			end

			it "should have a top bid of 600" do
				green_chair_auction.call_current_top_bid.should == 600
			end

			it "should have a record of all bids made" do
				green_chair_auction.call_history.should == [[500, @time_of_bid1], [600, @time_of_bid2]]
			end

			it "should have a timecode associated with the most recent bid" do
				green_chair_auction.call_history(1, 0).should == 600
				green_chair_auction.call_history(1, 1).should == @time_of_bid2
			end

			describe "should not add a bid/history if bid is lower than current_top_bid" do
				before do
					@time_of_bid3 = Time.now
					green_chair_auction.add_bid([65, @time_of_bid3])
				end

				it "should have a top bid of 600, and not 65" do
					green_chair_auction.call_current_top_bid.should     == 600

					green_chair_auction.call_current_top_bid.should_not == 65
				end

				it "should not have updated the history to include the bid" do
					green_chair_auction.call_history.should     == [[500, @time_of_bid1], [600, @time_of_bid2]]

					green_chair_auction.call_history.should_not == [[500, @time_of_bid1], [600, @time_of_bid2], [65, @time_of_bid3]]
				end
			end
		end
	end

end
