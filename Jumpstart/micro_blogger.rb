require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing..."
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
  	if message.length <= 140
  		#! @client.update(message)
  		puts "Message is good to go, but not posted cuz its been commented out: #{message}"
  	else
  		puts "Message too long"
  	end
  end

  def dm(target, message)
    screen_names = @client.followers.collect{|follower| follower.screen_name}

  	#! test_message = "d @KyleBWeiss Test from rb file"
  	#! tweet(test_message)

    if screen_names.include?(target) 
      tweet(message)

      puts "Trying to send #{target} this direct message:"
      puts message

    else
      puts "Can't send #{target} the message: '#{message}' as they do not follow me"
      
    end

    #! puts "#{screen_names}"
    
  end

  def followers_list
    screen_names 

    return follower_screen_names

  end


  def run
  	puts "Welcome to the JSL Twitter Client!"
  	command = ""
  	while command != "q"
  		printf "enter command:"
  		input = gets.chomp
  		parts = input.split(" ")
  		command = parts[0]

  		case command
  		when 'q' then puts "Goodbye!"
  		when 'dm' then dm(parts[1], parts[2..-1].join(" "))
  		when 't' then tweet(parts[1..-1].join(" "))
  		else
  			puts "Sorry, I dont know how respond to #{command}"
  		end

  	end

  end

end

 blogger = MicroBlogger.new
 blogger.run