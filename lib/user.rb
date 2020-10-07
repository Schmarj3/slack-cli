require_relative 'recipient'

module Workspace
  class User < Recipient
    attr_reader :real_name,

        def initialize(real_name)
          super(slack_id, name)
          @real_name = real_name
        end

    def details

    end

    def self.list_all
      #  wave 1
    end

  end
end