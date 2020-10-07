Dotenv.load


class Workspace
  attr_reader :channels, :users

  def initialize
    @channels = []
    @users = []
  end

  # def add_channel (channel)
  # @channels << channel
  # end

  def select_channel
    #
  end

  def select_user
    #
  end

  def show_details
    #
  end

  def send_message
    #
  end
end



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
# end