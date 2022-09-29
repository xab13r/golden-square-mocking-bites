class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def title
    return @title
  end

  def artist
    return @artist
  end

  def matches?(keyword)
    # Returns true if the keyword matches either the title or artist
    return @title.include?(keyword) || @artist.include?(keyword)
  end
end
