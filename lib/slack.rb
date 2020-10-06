#!/usr/bin/env ruby
require 'dotenv'
require 'httparty'

require_relative 'workspace'

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new("Fun", ["general", "questions", "seattle-stuff"], ["sophia"])
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

pp response['channels']