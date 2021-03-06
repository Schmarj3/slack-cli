require 'httparty'
require_relative 'recipient'

USER_URL = "https://slack.com/api/users.list"


class User < Recipient
  attr_reader :real_name

  def initialize(slack_id, name, real_name)
    super(slack_id, name)
    @real_name = real_name
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
end