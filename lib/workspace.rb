class Workspace
  attr_reader :workspace, :channels, :users

  def initialize(workspace, channels, users)
    @workspace = workspace
    @channels = channels
    @users = users
  end


end