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
      #when gets.chomp = "random"
      puts "Type : random"
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
end