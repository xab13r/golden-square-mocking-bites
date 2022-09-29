require 'music_library'

RSpec.describe MusicLibrary do
	it "constructs" do
		music_library = MusicLibrary.new
		expect(music_library.all).to eq []
	end

	describe "after adding multiple tracks" do
		it "can return a list of the tracks" do
			music_library = MusicLibrary.new
			track_1 = double :fake_track_entry
			track_2 = double :fake_track_entry
			music_library.add(track_1)
			music_library.add(track_2)
			expect(music_library.all).to eq [track_1, track_2]
		end
	end

	describe "search behavior" do
		it "returns a list of matching tracks" do
			music_library = MusicLibrary.new
			track_1 = double :fake_track_entry, matches?: true
			track_2 = double :fake_track_entry, matches?: false
			track_3 = double :fake_track_entry, matches?: false
			track_4 = double :fake_track_entry, matches?: true
			music_library.add(track_1)
			music_library.add(track_2)
			music_library.add(track_3)
			music_library.add(track_4)
			expect(music_library.search("keyword")).to eq [track_1, track_4]
		end

		it "returns an empty list when tehre are no matches" do
			music_library = MusicLibrary.new
			track_1 = double :fake_track_entry, matches?: false
			track_2 = double :fake_track_entry, matches?: false
			track_3 = double :fake_track_entry, matches?: false
			track_4 = double :fake_track_entry, matches?: false
			music_library.add(track_1)
			music_library.add(track_2)
			music_library.add(track_3)
			music_library.add(track_4)
			expect(music_library.search("keyword")).to eq []
		end

		it "fails when keyword is blank" do
			music_library = MusicLibrary.new
			expect { music_library.search("") }.to raise_error "Keyword must be provided"
		end
	end
end