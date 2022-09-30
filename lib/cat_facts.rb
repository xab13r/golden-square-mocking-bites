# frozen_string_literal: true

require 'json'
require 'net/http'

class CatFacts
  def initialize(requester)
    @requester = requester
  end

  def provide
    "Cat fact: #{get_cat_fact['fact']}"
  end

  private

  def get_cat_fact
    text_response = @requester.get(URI('https://catfact.ninja/fact'))
    JSON.parse(text_response)
  end
end

fact = CatFacts.new(Net::HTTP)
p fact.provide
