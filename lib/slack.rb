#!/usr/bin/env ruby
require 'dotenv'
require 'httparty'

require_relative 'workspace'
Dotenv.load

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new
  p workspace
  # TODO project

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME



query_parameters = {
    token: ENV["SLACK_TOKEN"]
}


url = 'https://slack.com/api/conversations.list'
response = HTTParty.get(url, query: query_parameters)

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