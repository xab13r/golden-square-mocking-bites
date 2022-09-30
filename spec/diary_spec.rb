require "diary"

RSpec.describe Diary do
	it "constructs" do
		diary = Diary.new("this is some content")
		expect(diary.read).to eq "this is some content"
	end
end