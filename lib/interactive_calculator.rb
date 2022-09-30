class InteractiveCalculator
	def initialize(terminal)
		@terminal = terminal
	end

	def run
		@terminal.puts "Hello. I will subtract two numbers."
		@terminal.puts "Please enter a number"
		num1 = get_number
		@terminal.puts "Please enter another number"
		num2 = get_number
		@terminal.puts "Here is your result:"
		@terminal.puts format_sum(num1, num2)
	end

	private

	def get_number
		response = @terminal.gets
		return response.to_i if response.to_i.to_s == response
		fail "You must enter a number"
	end

	def format_sum(num1, num2)
		result = num1 - num2
		return "#{num1} - #{num2} = #{result}"
	end
end