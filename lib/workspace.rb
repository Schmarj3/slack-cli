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

  # possible refactoring using .find & one parameter
  def select_channel
    name = gets.chomp
    if name
      selected = @channels.filter {|hash| hash.name == name }[0]
      results  = selected.nil? ? "No channel by that name" : selected.name
      puts "Result: #{results}"
    elsif slack_id
      selected = @channels.filter {|hash| hash.slack_id == slack_id }[0]
      results  = selected.nil? ? "No channel by that name" : selected.slack_id
      puts "Result: #{results}"
    end
    @selected = selected
    return selected
  end

  # possible refactoring using .find & one parameter
  def select_user
    name = gets.chomp
    if name
      selected = @users.filter {|hash| hash.name == name }[0]
      results  = selected.nil? ? "No user by that name" : selected.name
      puts "Result: #{results}"
    elsif slack_id
      selected = @users.filter {|hash| hash.slack_id == slack_id }[0]
      results  = selected.nil? ? "No user by that name" : selected.slack_id
      puts "Result: #{results}"
    else
      puts "Please try again"
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
      pp @selected.send_message(message)
    end
  end
end