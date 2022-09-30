require 'string_repeater'

RSpec.describe StringRepeater do
	it "repeates a string the number of times indicated" do
		terminal = double(:terminal)

		expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.")
		expect(terminal).to receive(:puts).with("Please enter a string")
		expect(terminal).to receive(:gets).and_return("TWIX")
		expect(terminal).to receive(:puts).with("Please enter a number of repeats")
		expect(terminal).to receive(:gets).and_return("10")
		expect(terminal).to receive(:puts).with("Here is your result:")
		expect(terminal).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")

		string_repeater = StringRepeater.new(terminal)
		string_repeater.run
	end

	it "return an empty string if the string is empty" do
		terminal = double(:terminal)

		expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.")
		expect(terminal).to receive(:puts).with("Please enter a string")
		expect(terminal).to receive(:gets).and_return("")
		expect(terminal).to receive(:puts).with("Please enter a number of repeats")
		expect(terminal).to receive(:gets).and_return("10")
		expect(terminal).to receive(:puts).with("Here is your result:")
		expect(terminal).to receive(:puts).with("")

		string_repeater = StringRepeater.new(terminal)
		string_repeater.run
	end

	it "fails if a string is passed instead of a number as repeats" do
		terminal = double(:terminal)

		expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.")
		expect(terminal).to receive(:puts).with("Please enter a string")
		expect(terminal).to receive(:gets).and_return("TWIX")
		expect(terminal).to receive(:puts).with("Please enter a number of repeats")
		expect(terminal).to receive(:gets).and_return("jim")

		string_repeater = StringRepeater.new(terminal)
		expect { string_repeater.run }.to raise_error "You must enter a number"
	end
end