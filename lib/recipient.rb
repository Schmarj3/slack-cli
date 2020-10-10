require 'dotenv'
require 'httparty'
Dotenv.load

# BASE_URL = 'https://slack.com/api/'

API_KEY = ENV['SLACK_TOKEN']
PARAMS = {token: API_KEY}

class Recipient
  attr_reader :slack_id, :name

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def send_message(message)
    p message
    p API_KEY
    p @slack_id
    # p BASE_URL

    response = HTTParty.post(
        "https://slack.com/api/chat.postMessage",
        body:  {
            token: API_KEY,
            text: message,
            channel: @slack_id
        },
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )
    return response.code == 200 && response.parsed_response["ok"]
  end

  def self.get(url, params)
    response = HTTParty.get(url, query: params)
    return response
  end

  private

  def details
    raise NotImplementedError, 'Implement me in a child class!'
  end

  def self.list_all
    raise NotImplementedError, 'Implement me in a child class!'
  end

end
