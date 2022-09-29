class MusicLibrary
  def initialize
    @library = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @library.push(track)
  end

  def all
    # Returns a list of track objects
    @library
  end

  def search(keyword)
    raise 'Keyword must be provided' if keyword == ''

    @library.select { |song| song.matches?(keyword) }
  end
end
