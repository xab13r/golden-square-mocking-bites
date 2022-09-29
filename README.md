# Mocking Bites

## Unit Testing Parent-Child Classes

A parent-child relationship between classes is one where there is a single class that looks after a list of other classes.

### Exercise

Perform Integration tests and Unit tests for the following classes:

```ruby
# File: lib/music_library.rb

class MusicLibrary
  def initialize
	# ...
  end

  def add(track) # track is an instance of Track
	# Track gets added to the library
	# Returns nothing
  end

  def all
	# Returns a list of track objects
  end

  def search(keyword) # keyword is a string
	# Returns a list of tracks that match the keyword
  end
end
```

```ruby
# File: lib/track.rb

class Track
  def initialize(title, artist) # title and artist are both strings
  end

  def matches?(keyword) # keyword is a string
	# Returns true if the keyword matches either the title or artist
  end
end
```

- [Test](./spec/)
- [Code](./lib/)