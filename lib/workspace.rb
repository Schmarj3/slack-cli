require_relative 'user'
require_relative 'channel'


class Workspace
  attr_reader :channels, :users, :selected

  def initialize(selected: nil)
    @channels = Channel.list_all
    @users = User.list_all
    @selected
  end

  # def add_channel (channel)
  # @channels << channel
  # end
  #
  # def select_channel(name, slack_id)
  #   selected variable
  #   if searching by name
  #     selected = find name in list of @channels["name"]
  #   end
  #
  #   if searching by slack_id
  #     selected = find slack_id in the list of @channels["id"]
  #   end
  #   #return selected
  # end
  #
  # def select_user(name, slack_id)
  #   selected variable
  #   if searching by name
  #     selected = find name in list of @users["name"]
  #   end
  #
  #   if searching by slack_id
  #     selected = find slack_id in the list of @users["id"]
  #   end
  #   #return selected
  # end

  def show_details
    # if select_user returned
    # display details (username, real name, slack ID)
    # if select_channel returned
    # display details (channel name, topic, member count, slack ID)
  end

  def send_message
    #
  end
end

new_workspace = Workspace.new()

pp new_workspace