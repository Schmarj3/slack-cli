require 'httparty'
require 'dotenv'

require_relative 'recipient'
Dotenv.load

USER_URL = "#{BASE_URL}users.list"


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
    puts "slack_id: #{slack_id}, name: #{name}, real_name: #{real_name}"
  end

  def self.list_all
    all_members = self.get(USER_URL, PARAMS)["members"]

    all_members.map do |user_hash|
      new(
          user_hash["id"],
          user_hash["name"],
          user_hash["real_name"]
      )
    end
  end

  # def send_message(message)
  #   # call on the recepient class here to send message to user
  # end
end