require 'httparty'
require 'dotenv'

require_relative 'recipient'
Dotenv.load


URL = "https://slack.com/api/conversations.list"
PARAMS = {
    token: ENV["SLACK_TOKEN"]
}

module Workspace
  class Channel < Recipient
    attr_reader :slack_id, :name, :topic, :member_count,

    def initialize(slack_id, name, topic, member_count)
      # super(slack_id, name)
      @slack_id = slack_id
      @name = name
      @topic = topic
      @member_count = member_count
    end

    def self.get(url, params)
      response = HTTParty.get(url, query: params)
      return response
    end


    def details
      p self.get(URL, PARAMS)
      # display details (channel name, topic, member count, slack ID)
    end

    def self.list_all

    end

  end
end


channels = Workspace::Channel.new

p channels.details

# query_parameters = {
#     token: ENV["SLACK_TOKEN"]
# }


# url = 'https://slack.com/api/conversations.list'
# response = HTTParty.get(url, query: query_parameters)

# pp response
#
#
# workspace : {
#     "ok"=> true,
#     "channel": [
#         {
#             general-channel
#         },
#         {
#             random-channel
#         },
#         {
#             ada-slack-cli
#         }
#     ]
# }
#
# workspace : {
#     "ok"=> true,
#     "channel": [{channel at index 0}, {channel at index 1}, {channel at index 2}]
#     "channel": ["fire", "air", "water"]
#     "channel": [0, 1, 2]
# }
# puts response["channels"][1]["creater"]
#
# response["channels"][i]

# response["channels"].each do |i|
#   puts i["purpose"]["last_set"]
#