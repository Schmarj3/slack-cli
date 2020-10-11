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
    it "should return channel instance for 'random'" do
      # when gets.chomp is equal to a valid channel or id
      puts "Type : 'random' or 'C01BWC8P6PQ'"
      selected = @workspace.select_channel

      expect(selected).must_be_kind_of Channel
      expect(selected.name).must_equal "random"
    end

    it "test for no matching channel" do
      #when gets.chomp = "test"
      puts "Type : test"
      expect(@workspace.select_channel).must_be_nil
    end
  end

  describe "select_user method" do
    it "should return user instance for 'slackbot'" do
      # when gets.chomp is equal to a valid user name or id
      puts "Type : 'slackbot' or 'USLACKBOT'"
      selected = @workspace.select_user

      expect(selected).must_be_kind_of User
      expect(selected.name).must_equal "slackbot"
    end

    it "test for no matching user" do
      #when gets.chomp = "test"
      puts "Type : test"
      expect(@workspace.select_user).must_be_nil
    end
  end

  describe "show_details method" do
    it "should return selected channel details in an array" do
      puts "Type a valid channel name:"
      @selected = @workspace.select_channel

      expect(@workspace.show_details).must_be_kind_of Array
      expect(@selected).must_be_kind_of Channel
      expect(@workspace.show_details.length).must_equal 4
    end

    it "should return selected user details in an array" do
      puts "Type a valid user name:"
      @selected = @workspace.select_user

      expect(@workspace.show_details).must_be_kind_of Array
      expect(@selected).must_be_kind_of User
      expect(@workspace.show_details.length).must_equal 3
    end
  end

  # describe "Recipient.list_all method call" do
  #   it "should return an array of channel instances" do
  #     expect(@workspace.channels).must_be_kind_of Array
  #     expect(@workspace.channels.length).must_equal 3
  #   end
  #
  #   it "should return an array of user instances" do
  #     expect(@workspace.users).must_be_kind_of Array
  #     expect(@workspace.users.length).must_equal 5
  #   end
  # end

  describe "send_message method" do

    it "sends a message to a user" do
      VCR.use_cassette("create a workspace") do
        puts "select a valid user"
        @selected = @workspace.select_user
        expect(@workspace.send_message).must_equal true
      end
    end

    it "sends a message to a channel" do
      VCR.use_cassette("create a workspace") do
        puts "select a valid channel"
        @selected = @workspace.select_channel
        expect(@workspace.send_message).must_equal true
      end
    end
  end
end