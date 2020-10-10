require_relative 'test_helper'

describe SlackApi do
  it "can send a valid message" do
    VCR.use_cassette("slack-posts") do
      response = SlackApi.send_msg("Hey I can post messages!", "YOUR-CHANNEL-NAME")
      expect(response).must_equal true
    end
  end
end