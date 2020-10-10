require_relative 'test_helper'
require 'channel'
describe "Channel Class" do

  describe "initialize" do
    before do
      @id = "C012AB3CD"
      @name = "random"
      @topic = {
              "value": "Company-wide announcements and work-based matters",
              "creator": "",
              "last_set": 0
          }
      @num_members = 4

      @channel = Channel.new(@id, @name, @topic, @num_members)
    end

    it "creates a new channel" do
      expect(@channel).must_be_kind_of Channel
    end

    it "is an instance of id" do
      expect(@channel.slack_id).must_be_kind_of String
    end

    it "is an instance of name" do
      expect(@channel.name).must_be_kind_of String
    end

    it "is an instance of topic" do
      expect(@channel.topic).must_be_kind_of Hash
    end

    it "is an instance of member_count" do
      expect(@channel.member_count).must_be_kind_of Integer
    end


  end
  xdescribe "list all" do
    expect(@channel.list_all).must_be_equal to self.list_all

  end
end