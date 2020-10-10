require_relative 'test_helper'
require 'workspace'

describe "Workspace Class" do

  describe "initialize" do
    before do
      @channels = [1,2,3,4]
      @users = ["A", "B", "C", "D"]
      @selected = nil

      @workspace = Workspace.new
    end

    it "creates a new workspace" do
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
  # xdescribe "list all" do
  #   expect(@channel.list_all).must_be_equal to self.list_all
  #
  # end
end