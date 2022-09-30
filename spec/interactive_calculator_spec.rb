require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
	it "subtracts two number using the terminal" do
		terminal = double(:terminal)

		expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.")
		expect(terminal).to receive(:puts).with("Please enter a number")
		expect(terminal).to receive(:gets).and_return("4")
		expect(terminal).to receive(:puts).with("Please enter another number")
		expect(terminal).to receive(:gets).and_return("3")
		expect(terminal).to receive(:puts).with("Here is your result:")
		expect(terminal).to receive(:puts).with("4 - 3 = 1")

		interactive_calculator = InteractiveCalculator.new(terminal)
		interactive_calculator.run
	end

	it "fails if given a string instead of the first number" do
		terminal = double(:terminal)

		expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.")
		expect(terminal).to receive(:puts).with("Please enter a number")
		expect(terminal).to receive(:gets).and_return("Jim")

		interactive_calculator = InteractiveCalculator.new(terminal)
		expect { interactive_calculator.run }.to raise_error "You must enter a number"
	end

	it "fails if given a string instead of the second number" do
		terminal = double(:terminal)

		expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.")
		expect(terminal).to receive(:puts).with("Please enter a number")
		expect(terminal).to receive(:gets).and_return("4")
		expect(terminal).to receive(:puts).with("Please enter another number")
		expect(terminal).to receive(:gets).and_return("Jim")

		interactive_calculator = InteractiveCalculator.new(terminal)
		expect { interactive_calculator.run }.to raise_error "You must enter a number"
	end
end