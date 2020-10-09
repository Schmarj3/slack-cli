require_relative 'user'
require_relative 'channel'


class Workspace
  attr_reader :channels, :users, :selected

  def initialize(selected: nil)
    @channels = Channel.list_all
    @users = User.list_all
    @selected
  end

  # possible refactoring using .find & one parameter
  def select_channel(name, slack_id)
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
  def select_user(name, slack_id)
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

  # def show_details
  #   @selected ? @selected.details : puts("No recipient is currently selected.")
  # end
  module SlackApiWrapper
    BASE_URL = ""

  end
  def send_message
    # store the user's message
    # semd message to the @selected recipient
  end
end
#
# new_workspace = Workspace.new()

# pp new_workspace.channels
# pp new_workspace.users

#  pp new_workspace.select_channel("general", "C01BNBZJVU7")
#
#  pp new_workspace.select_channel("general", nil)
#
# pp new_workspace.select_channel(nil, "C01BNBZJVU7")
#
# pp new_workspace.select_user("sophiadonan", nil)