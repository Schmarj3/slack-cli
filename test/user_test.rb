require_relative 'test_helper'
require 'user'
describe "User Class" do

  describe "initialize" do
    before do
      @id = "C012AB3CD"
      @name = "slackbot"
      @real_name = "Slack Bot"

      @user = User.new(@id, @name, @real_name)
    end

    it "creates a new user" do
      expect(@user).must_be_kind_of User
    end

    it "is an instance of id" do
      expect(@user.slack_id).must_be_kind_of String
    end

    it "is an instance of name" do
      expect(@user.name).must_be_kind_of String
    end

    it "is an instance of real_name" do
      expect(@user.real_name).must_be_kind_of String
    end


  end
  # xdescribe "list all" do
  #   expect(@channel.list_all).must_be_equal to self.list_all
  #
  # end
end