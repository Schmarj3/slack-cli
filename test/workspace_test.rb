require_relative 'test_helper'
require 'workspace'

describe "Workspace Class" do
  before do
    VCR.use_cassette("create a workspace") do
      @workspace = Workspace.new
    end
  end
  describe "initialize" do
    it "is an instance of workspace" do
      expect(@workspace).must_be_kind_of Workspace
    end

    it "is an array of values" do
      expect(@workspace.channels).must_be_kind_of Array
    end

    it "is an array of strings" do
      expect(@workspace.users).must_be_kind_of Array
    end

    it "default value of selected is nil" do
      expect(@workspace.selected).must_be_nil
    end
  end

  describe "select_channel method" do
    it "should return channel instance for given channel name" do
      user_input = 'random'
      selected = @workspace.select_channel(user_input)

      expect(selected).must_be_kind_of Channel
      expect(selected.name).must_equal "random"
    end

    it "should return channel instance for given channel id" do
      user_input = 'C01BWC8P6PQ'
      selected = @workspace.select_channel(user_input)

      expect(selected).must_be_kind_of Channel
      expect(selected.slack_id).must_equal "C01BWC8P6PQ"
    end

    it "test for no matching channel" do
      user_input = 'test'
      expect(@workspace.select_channel(user_input)).must_be_nil
    end
  end

  describe "select_user method" do
    it "should return user instance for 'slackbot'" do
      # when gets.chomp is equal to a valid user name or id
      user_input = 'slackbot'
      selected = @workspace.select_user(user_input)

      expect(selected).must_be_kind_of User
      expect(selected.name).must_equal "slackbot"
    end

    it "should return user instance for 'USLACKBOT'" do
      # when gets.chomp is equal to a valid user name or id
      user_input = 'USLACKBOT'
      selected = @workspace.select_user(user_input)

      expect(selected).must_be_kind_of User
      expect(selected.slack_id).must_equal 'USLACKBOT'
    end

    it "test for no matching user" do
      #when gets.chomp = "test"
      user_input = 'test'
      expect(@workspace.select_user(user_input)).must_be_nil
    end
  end

  describe "show_details method" do
    it "should return selected channel details in an array" do
      user_input = 'random'
      @selected = @workspace.select_channel(user_input)

      expect(@workspace.show_details).must_be_kind_of Array
      expect(@selected).must_be_kind_of Channel
      expect(@workspace.show_details.length).must_equal 4
    end

    it "should return selected user details in an array" do
      user_input = 'slackbot'
      @selected = @workspace.select_user(user_input)

      expect(@workspace.show_details).must_be_kind_of Array
      expect(@selected).must_be_kind_of User
      expect(@workspace.show_details.length).must_equal 3
    end
  end

  # describe "send_message method" do
  #
  #   it "sends a message to a user" do
  #     VCR.use_cassette("create a workspace") do
  #       expect(@workspace.send_message).must_equal true
  #     end
  #   end
  #
  #   it "sends a message to a user" do
  #     VCR.use_cassette("create a workspace") do
  #       expect(@workspace.send_message).must_equal false
  #     end
  #   end
  #
  #   it "sends a message to a channel" do
  #     VCR.use_cassette("create a workspace") do
  #       expect(@workspace.send_message).must_equal true
  #     end
  #   end
  #
  #   it "sends a message to a channel" do
  #     VCR.use_cassette("create a workspace") do
  #       expect(@workspace.send_message).must_equal false
  #     end
  #   end
  # end
end