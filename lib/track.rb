# frozen_string_literal: true

class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  attr_reader :title, :artist

  def matches?(keyword)
    # Returns true if the keyword matches either the title or artist
    @title.include?(keyword) || @artist.include?(keyword)
  end
end
