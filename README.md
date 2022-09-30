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

## Unit Testing Peer Classes

### Exercise

Write integration tests and unit test for the following classes:

```ruby
# File: lib/secret_diary.rb

class SecretDiary
  def initialize(diary) # diary is an instance of Diary
    # ...
  end

  def read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
  end

  def lock
    # Locks the diary
    # Returns nothing
  end

  def unlock
    # Unlocks the diary
    # Returns nothing
  end
end
```

```ruby
# File: lib/diary.rb

class Diary
  def initialize(contents) # contents is a string
  end

  def read
    # Returns the contents of the diary
  end
end
```

- Code:
  - [Diary](./lib/diary.rb)
  - [SecretDiary](./lib/secret_diary.rb)
- Tests:
  - [diary_spec](./spec/diary_spec.rb)
  - [secret_diary_spec](./spec/secret_diary_spec.rb)
  - [secret_diary_integration_spec](./spec/secret_diary_integration_spec.rb)

## Unit Testing API Requests

In order to unit test an API we will have to replace `Net::HTTP` with a `double`.

```ruby
def make_request_to_api
  text_response = Net::HTTP.get("www.boredapi.com", "/api/activity")
  return JSON.parse(text_response)
end
```

Needs to be changed to:

```ruby
def make_request_to_api
  # We use '@requester' rather than 'Net:HTTP'
  text_response = @requester.get(URI("https://www.boredapi.com/api/activity"))
  return JSON.parse(text_response)
end
```

Then, we will have to pass the `@requester` to the class via the `initialize` method.

```ruby
def initialize(requester) # requester is usually Net::HTTP
  @requester = requester
end
```

And for RSpec that translates to:

```ruby
requester_dbl = double :requester
expect(requester_dbl).to receive(:get).with(URI(<API anchor>)).and_return(<API response>)

activity_suggester = ActivitySuggester.new(requester_dbl)
result = activity_suggester.suggest
expect(result).to eq "Why not: Take your dog on a walk"
```

### Exercise

- [Code](./lib/time_error.rb)
- [Test](./spec/time_error_spec.rb)

### Challenge

- [Code](./lib/cat_facts.rb)
- [Test](./spec/cat_facts_spec.rb)

## Unit Testing Terminal IO

Here is a class that is hard to test:

```ruby
class Greeter
  def greet
    puts "What is your name?"
    name = gets.chomp
    puts "Hello, #{name}!"
  end
end
```

`puts` doesn't return and `gets` is not the same as passing arguments.

We need to create doubles for `puts` and `gets`.

```ruby
class Greeter
  def greet
    Kernel.puts "What is your name?"
    name = Kernel.gets.chomp
    Kernel.puts "Hello, #{name}!"
  end
end
```

`Kernel` is an implicit object in Ruby, but it's always there.
In reality we only have to create a double for `Kernel`.

```ruby
class Greeter
  def initialize(io)
    @io = io
  def greet
    @io.puts "What is your name?"
    name = @io.gets.chomp
    @io.puts "Hello, #{name}!"
  end
end
```

Then our test becomes:
```ruby
RSpec.describe Greeter do
  it "greets the user" do
    io = double(:io)
    expect(io).to receive(:puts).with("What is your name?")
    expect(io).to receive(:gets).and_return("Kay")
    expect(io).to receive(:puts).with("Hello, Kay!")

    greeter = Greeter.new(io)
    greeter.greet
  end
end
```
