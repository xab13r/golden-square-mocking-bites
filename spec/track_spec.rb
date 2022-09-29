require 'track'

RSpec.describe Track do
  it 'constructs correctly' do
    track = Track.new('this is the title', 'my artist')
    expect(track.title).to eq 'this is the title'
    expect(track.artist).to eq 'my artist'
  end

  describe 'matches? behavior' do
    it 'returns true if keyword is found in title' do
      track = Track.new('this is the title', 'my artist')
      expect(track.matches?('title')).to eq true
    end

    it 'returns true if keyword is found in artist' do
      track = Track.new('this is the title', 'my artist')
      expect(track.matches?('my')).to eq true
    end

    it 'returns true if keyword is found in artist and title' do
      track = Track.new('my title', 'my artist')
      expect(track.matches?('my')).to eq true
    end

    it 'returns false if keyword is not found in artist nor title' do
      track = Track.new('my title', 'my artist')
      expect(track.matches?('hello')).to eq false
    end
  end
end
