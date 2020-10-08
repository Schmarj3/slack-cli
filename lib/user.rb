require 'httparty'
require 'dotenv'

require_relative 'recipient'
Dotenv.load


URL = "https://slack.com/api/users.list"
PARAMS = {
    token: ENV["SLACK_TOKEN"]
}


class User < Recipient
  attr_reader :real_name

      def initialize(slack_id, name, real_name)
        super(slack_id, name)
        @real_name = real_name
      end

  def get(url, params)
    response = HTTParty.get(url, query: params)
    return response
  end


  def details
    return get(URL, PARAMS)
  #   # display details (channel name, topic, member count, slack ID)
  end

  def self.list_all
    #  an array of all the oublic channel names
  end

end



users = User.new("asdofjof", "asdkfljas", "sldkf")


pp users.details

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
