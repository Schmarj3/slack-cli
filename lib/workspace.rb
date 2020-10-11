require_relative 'user'
require_relative 'channel'
require 'httparty'

class Workspace
  attr_reader :channels, :users, :selected

  def initialize(selected: nil)
    @channels = Channel.list_all
    @users = User.list_all
    @selected
  end

  def select_channel
    user_input = gets.chomp

    if user_input
      selected = @channels.find { |hash| hash.name == user_input }

      if selected.nil?
        selected = @channels.find {|hash| hash.slack_id == user_input }
      end

      results = selected.nil? ? "This is not a valid Channel" : selected.name
      puts "Result: #{results} "
    end

    @selected = selected
    return selected
  end

  def select_user
    user_input = gets.chomp

    if user_input
      selected = @users.find { |hash| hash.name == user_input }

      if selected.nil?
        selected = @users.find {|hash| hash.slack_id == user_input }
      end

      results = selected.nil? ? "This is not a valid User" : selected.name
      puts "Result: #{results} "
    end

    @selected = selected
    return selected
  end

  def show_details
    if @selected.is_a?(User)
      pp [@selected.slack_id, @selected.name, @selected.real_name]
    elsif @selected.is_a?(Channel)
      pp [@selected.name, @selected.topic, @selected.member_count, @selected.slack_id]
    end
  end

  def send_message
    # store the user's message
    # semd message to the @selected recipient
    if @selected.nil?
      puts "Please select a user or channel."
    else
      puts "Enter your message here:"
      message = gets.chomp
      http_post_response = @selected.send_message(message)
      p http_post_response
    end

    return !!http_post_response
  end
end