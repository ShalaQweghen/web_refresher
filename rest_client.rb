require "rest-client"

class Query

	def initialize
		start
		proceed
	end

	def start
		puts "====================================="
		puts "This is a simple google search query."
		puts "====================================="
	end

	def get_input
		print "\nPlease enter your keyword for search: "
		@query = gets.chomp
	end

	def proceed
		get_input
		get
		get_choice
		show
		continue_or_exit
		decide
	end

	def get
		@response = RestClient.get "https://www.google.com/search", { :params => { :q => "#{@query}" } }
	end

	def code
		puts "\nThe response code is #{@response.code}"
	end

	def header
		puts "\nThe response headers are:\n#{@response.headers}"
	end

	def cookie
		puts "\nThe response cookie is #{@response.cookies}"
	end

	def body
		puts "\nThe response body is:\n#{@response.body}"
	end

	def get_choice
		puts "\nTo see the response code, type '1'. To see the response headers, type '2'.\nTo see the response cookie, type '3'. To see the response body, type '4'.\nTo make a new seach, type '9'. To exit, type '0'."
		@choice = gets.chomp.to_i
	end

	def replay
		get_choice
		show
	end

	def show
		case @choice
			when 1 
				code
				replay
			when 2
				header
				replay
			when 3 
				cookie
				replay
			when 4
				body
				replay
			when 9
				proceed
			when 0
				exit
			else
				replay
			end
	end
end

Query.new


