#!/usr/bin/env ruby
require 'dotenv'
require 'httparty'

require_relative 'workspace'


def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  exit_program = false

  until exit_program
    puts "Please select an option:"
    puts "A. List Users"
    puts "B. List Channels"
    puts "C. Quit Program"
    user_input = gets.chomp.upcase

    case user_input
    when "A", "LIST USERS"
      p workspace.users
    when "B", "LIST CHANNELS"
      p workspace.channels
    when "C", "QUIT"
      exit_program = true
    else
      puts "Incorrect value, please try again"
    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME