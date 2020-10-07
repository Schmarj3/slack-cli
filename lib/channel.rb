module Workspace
  class Channel < Recepient
    attr_reader :topic, :member_count

    def initialize(topic, member_count)
      super(slack_id, name)
      @topic = topic
      @member_count = member_count
    end

    def details

    end

    def self.list_all
    #  wave 1
    end

  end
end