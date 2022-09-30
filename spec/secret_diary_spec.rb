# frozen_string_literal: true

require 'secret_diary'

RSpec.describe SecretDiary do
  it 'constructs' do
    secret_diary = SecretDiary.new(double(:diary))
  end

  it "doesn't allow a locked diary to be read at the beginning" do
    diary = double(:diary, contents: 'this is some content', read: nil)

    secret_diary = SecretDiary.new(diary)

    expect { secret_diary.read }.to raise_error 'Go away!'
  end

  it 'allows an locked diary to be read' do
    diary = double(:diary, contents: 'this is some content')
    allow(diary).to receive(:read).and_return(diary.contents)

    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock

    expect(secret_diary.read).to eq 'this is some content'
  end

  it 'can change from locked to unlocked to locked again' do
    diary = double(:diary, contents: 'this is some content')
    allow(diary).to receive(:read).and_return(diary.contents)

    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error 'Go away!'

    secret_diary.unlock
    expect(secret_diary.read).to eq 'this is some content'

    secret_diary.lock
    expect { secret_diary.read }.to raise_error 'Go away!'
  end
end
