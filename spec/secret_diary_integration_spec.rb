# frozen_string_literal: true

require 'diary'
require 'secret_diary'

RSpec.describe 'SecretDiary Integration' do
  context 'when passed a diary' do
    it 'sets the diary to be locked by default' do
      diary = Diary.new('this is some content')
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error 'Go away!'
    end

    it 'can unlock and read the diary' do
      diary = Diary.new('this is some content')
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq 'this is some content'
    end

    it 'can unlock and lock the diary again' do
      diary = Diary.new('this is some content')
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq 'this is some content'
      secret_diary.lock
      expect { secret_diary.read }.to raise_error 'Go away!'
    end
  end
end
