require 'music_library'
require 'track'

RSpec.describe "Music Library Integration" do
  it "can add a track to the library" do
    music_library = MusicLibrary.new
    track = Track.new("my title", "my artist")
    music_library.add(track)
    expect(music_library.all).to eq [track]
  end

  it "can add multiple tracks to the library" do
    music_library = MusicLibrary.new
    track_1 = Track.new("my title", "my artist")
    track_2 = Track.new("my title", "my artist")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end

  it "can search through the library" do
    music_library = MusicLibrary.new
    track_1 = Track.new("my title 1", "my artist")
    track_2 = Track.new("my title", "my artist 2")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.search("1")).to eq [track_1]
    expect(music_library.search("2")).to eq [track_2]
  end
end
