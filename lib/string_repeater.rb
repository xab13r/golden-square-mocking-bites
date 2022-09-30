class StringRepeater
	def initialize(terminal)
		@terminal = terminal
	end

	def run
		@terminal.puts "Hello. I will repeat a string many times."
		@terminal.puts "Please enter a string"
		string = @terminal.gets
		@terminal.puts "Please enter a number of repeats"
		repeats = get_number
		@terminal.puts "Here is your result:"
		@terminal.puts "#{string * repeats}"
	end

	private

	def get_number
		response = @terminal.gets
		if response.to_i.to_s == response
			return response.to_i
		else
			fail "You must enter a number"
		end
	end
end