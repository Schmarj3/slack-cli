require_relative 'user'
require_relative 'channel'


class Workspace
  attr_reader :channels, :users, :selected

  def initialize(selected: nil)
    @channels = Channel.list_all
    @users = User.list_all
    @selected = select_channel(name, slack_id) ? select_channel(name, slack_id) : select_user(name, slack_id)
  end

  def select_channel(name, slack_id)
    if name
      selected = @channels.filter {|hash| hash.name == name }[0]
      puts "You have selected: #{selected.name}"
    elsif slack_id
      selected = @channels.filter {|hash| hash.slack_id == slack_id }[0]
      puts "You have selected: #{selected.slack_id}"
    end

    return selected
  end

  def select_user(name, slack_id)
    if name
      selected = @users.filter {|hash| hash.name == name }[0]
      puts "You have selected: #{selected.name}"

    elsif slack_id
      selected = @users.filter {|hash| hash.slack_id == slack_id }[0]
      puts "You have selected: #{selected.slack_id}"
    end

    return selected
  end

  def show_details(selected_value)
    if channel
    details = select_channel()
    end
  end

  def send_message
    #
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