require 'httparty'
require 'dotenv'

require_relative 'recipient'
Dotenv.load


USER_URL = "https://slack.com/api/users.list"


class User < Recipient
  attr_reader :real_name

  def initialize(slack_id, name, real_name)
    super(slack_id, name)
    @real_name = real_name
  end

  def self.get(url, params)
    response = HTTParty.get(url, query: params)
    return response
  end

  def details
  #   # display details (channel name, topic, member count, slack ID)
  end

  def self.list_all
    self.get(USER_URL, PARAMS).map do |user_hash|
      return new(
          user_hash["id"],
          user_hash["name"],
          user_hash["real_name"]
      )
    end
  end
end