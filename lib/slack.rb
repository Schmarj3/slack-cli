#!/usr/bin/env ruby
require_relative 'workspace'

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new("Fun", ["general", "questions", "seattle-stuff"], ["sophia"])
  p workspace
  # TODO project

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME

