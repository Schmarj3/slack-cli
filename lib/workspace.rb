Dotenv.load


class Workspace
  attr_reader :channels, :users, :selected

  def initialize
    @channels = []
    @users = []
    @selected = selected
  end

  # def add_channel (channel)
  # @channels << channel
  # end

  def select_channel(name, slack_id)
    selected variable
    if searching by name
      selected = find name in list of @channels["name"]
    end

    if searching by slack_id
      selected = find slack_id in the list of @channels["id"]
    end
    #return selected
  end

  def select_user(name, slack_id)
    selected variable
    if searching by name
      selected = find name in list of @users["name"]
    end

    if searching by slack_id
      selected = find slack_id in the list of @users["id"]
    end
    #return selected
  end

  def show_details
    # if select_user returned
    # display details (username, real name, slack ID)
    # if select_channel returned
    # display details (channel name, topic, member count, slack ID)
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