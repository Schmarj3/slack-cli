require_relative 'test_helper'

describe "Channel Class" do

  describe "initialize" do
    before do
      @test_slack = {
              "id": "C012AB3CD",
              "name": "random",
              "topic": {
                  "value": "Company-wide announcements and work-based matters",
                  "creator": "",
                  "last_set": 0
              },
              "num_members": 4
          }

      @channel = Channel.new(
          @test_slack['id'],
          @test_slack['name'],
          @test_slack['topic'],
          @test_slack['num_members']
      )
    end

    it "creates a new channel" do
      expect(@channel).must_be_kind_of Channel
    end


  end
  describe "initialize" do

  end
end