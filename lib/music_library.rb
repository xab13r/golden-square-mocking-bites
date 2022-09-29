class MusicLibrary
  def initialize
	@library = Array.new
  end

  def add(track) # track is an instance of Track
	# Track gets added to the library
	# Returns nothing
	@library.push(track)
  end

  def all
	# Returns a list of track objects
	return @library
  end

  def search(keyword)
	  fail "Keyword must be provided" if keyword == ''
	matching_songs = @library.select { |song| song.matches?(keyword) }
	return matching_songs
  end
end