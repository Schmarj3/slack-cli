require 'httparty'
require 'dotenv'

require_relative 'recipient'
Dotenv.load


CHANNEL_URL = "https://slack.com/api/conversations.list"


class Channel < Recipient
  attr_reader :topic, :member_count

  def initialize(slack_id, name, topic, member_count)
    super(slack_id, name)
    @topic = topic
    @member_count = member_count
  end

  # def  self.get(params)
  #   super(CHANNEL_URL, params)
  # end

  # def details
  #   puts "slack_id: #{slack_id}, name: #{name}, topic: #{topic}, member_count: #{member_count}"
  # end

  def self.list_all
    all_channels = self.get(CHANNEL_URL, PARAMS)["channels"]

    all_channels.map do |channel_hash|
      new(
          channel_hash["id"],
          channel_hash["name"],
          channel_hash["topic"],
          channel_hash["num_members"]
      )
    end
  end

  # def send_message(message)
  # # call on the recepient class here to send message to user
  # end
end


#
# def initialize(directory: './support')
#   @passengers = Passenger.load_all(directory: directory)
#   @trips = Trip.load_all(directory: directory)
#   @drivers = Driver.load_all(directory: directory)
#   connect_trips
# end
#
# def self.load_all(full_path: nil, directory: nil, file_name: nil)
#   full_path ||= build_path(directory, file_name)
#
#   return CSV.read(
#       full_path,
#       headers: true,
#       header_converters: :symbol,
#       converters: :numeric
#   ).map { |record| from_csv(record) }
# end
#
#
# def self.from_csv(record)
#   return new(
#       id: record[:id],
#       name: record[:name],
#       phone_number: record[:phone_num]
#   )
# end