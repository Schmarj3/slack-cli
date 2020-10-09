module SlackApi
  BASE_URL = 'https://slack.com/api/'
  API_KEY = ENV['SLACK_TOKEN']

  def self.send_msg(message, channel)

    response = HTTParty.post(
        "#{BASE_URL}/chat.postMessage",
        body:  {
            token: API_KEY,
            text: message,
            channel: channel
        },
        headers: { 'Content-Type' => 'application/x-www-form-urlencoded' }
    )

    return response.code == 200 && response.parsed_response["ok"]
  end
end