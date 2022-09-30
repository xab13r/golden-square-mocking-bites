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

### Challenge

- [Tests & Code](https://github.com/xab13r/golden-square/tree/main/codebases/mocking_bites)

## Crafting Doubles

These are examples on how to craft `doubles`:

- If you need an object: `double(:fake_object`
- If you need an object with methods: `double(:fake_object, method_name: <return value>`
- If you need an object with methods only returning values with given arguments:

```ruby
# As a class
class FakeObject
  def greet(name)
    fail unless name == "Kay"
    return "Hello, Kay!"
  end
end

# As a double
fake_object = double(:fake_object)
allow(fake_object).to receive(:greet).with("Kay").and_return("Hello, Kay!")
expect(fake_object.greet("Kay")).to eq "Hello, Kay!"

```

- If you need to verify methods are called with given arguments:

```ruby
# As a class
class FakeObject
  def initialize
    @greet_has_been_called = false
  end

  def greet(name)
    fail unless name == "Kay"
    @greet_has_been_called
    return "Hello, Kay!"
  end

  def has_greet_been_called
    return @greet_has_been_called
  end
end

# As a double
fake_object = double(:fake_object)
expect(fake_object).to receive(:greet).with("Kay").and_return("Hello, Kay!")
```

### Exercises

- [Test](./spec/crafting_double_exercise_spec.rb)

### Challenge

- [Test](./spec/crafting_double_challenge_spec.rb)


