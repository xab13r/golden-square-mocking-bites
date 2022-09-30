# frozen_string_literal: true

class MusicLibrary
  def initialize
    @library = []
  end

  # track is an instance of Track
  def add(track)
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
