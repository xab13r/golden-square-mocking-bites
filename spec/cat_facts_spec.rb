# frozen_string_literal: true

require 'cat_facts'

RSpec.describe CatFacts do
  it 'returns cat facts' do
    canned_response =

      fake_requester = double(:requester)
    allow(fake_requester).to receive(:get)
      .with(URI('https://catfact.ninja/fact'))
      .and_return("{\"fact\":\"The silks created by weavers in Baghdad were inspired by the beautiful and varied colors and markings of cat coats. These fabrics were called \'tabby\' by European traders.\",\"length\":174}")
    cat_facts = CatFacts.new(fake_requester)
    expected = "Cat fact: The silks created by weavers in Baghdad were inspired by the beautiful and varied colors and markings of cat coats. These fabrics were called \'tabby\' by European traders."

    expect(cat_facts.provide).to eq expected
  end
end
