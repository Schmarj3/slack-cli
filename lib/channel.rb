require 'httparty'
require 'dotenv'

require_relative 'recipient'
Dotenv.load


CHANNEL_URL = "https://slack.com/api/conversations.list"


class Channel < Recipient
  attr_reader :topic, :member_count

  def initialize(slack_id, name, topic, member_count)
    super(slack_id, name)
    @topic = topic
    @member_count = member_count
  end

  def self.list_all
    all_channels = self.get(CHANNEL_URL, PARAMS)["channels"]

    all_channels.map do |channel_hash|
      new(
          channel_hash["id"],
          channel_hash["name"],
          channel_hash["topic"],
          channel_hash["num_members"]
      )
    end
  end
end