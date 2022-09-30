# frozen_string_literal: true

require 'time_error'

RSpec.describe TimeError do
  it 'returns the difference between remote and local clock' do
    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(URI('https://worldtimeapi.org/api/ip')).and_return('{"abbreviation":"BST","client_ip":"212.132.218.171","datetime":"2022-09-30T12:01:26.991291+01:00","day_of_week":5,"day_of_year":273,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1664535686,"utc_datetime":"2022-09-30T11:01:26.991291+00:00","utc_offset":"+01:00","week_number":39}')
    time = Time.new(2022, 9, 30, 12, 0o5, 0o0)
    time_error = TimeError.new(fake_requester)
    expect(time_error.error(time)).to eq(-213.008709)
  end
end
