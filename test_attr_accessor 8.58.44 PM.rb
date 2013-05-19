class Address
	attr_accessor :street, :special_location, :city, :state, :zip

	def initialize
		@street = @special_location = @city = @state = @zip = ""
	end

	def call_full_address
		puts "#{@street}"
		if @special_location != ""
			puts "#{@special_location}"
		end
		puts "#{@city}, #{@state} #{@zip}"
	end

end

address = Address.new
address.street = "415 Milestone St."
address.special_location = "14th Floor"
address.city = "Somewheretown"
address.state = "Colorado"
address.zip = 55555

address.call_full_address
