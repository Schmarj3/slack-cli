require_relative 'test_helper'

describe "Recipient Class" do
  before do
    VCR.use_cassette("create a workspace") do
      @workspace = Workspace.new
    end
  end

  describe "Recipient.list_all method call" do
    it "should return an array of channel instances" do
      expect(@workspace.channels).must_be_kind_of Array
      expect(@workspace.channels.length).must_equal 3
    end

    it "should return an array of user instances" do
      expect(@workspace.users).must_be_kind_of Array
      expect(@workspace.users.length).must_equal 5
    end
  end
end
