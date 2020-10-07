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
    puts "C. Select User"
    puts "D. Select Channel"
    puts "E. Details"
    puts "F. Quit Program"
    user_input = gets.chomp.upcase

    case user_input
    when "A", "LIST USERS"
      p workspace.users
    when "B", "LIST CHANNELS"
      p workspace.channels
    when "C", "SELECT USER"
      p workspace.selected
      p "print out selected user as the current recipient"
    when "D", "SELECT CHANNEL"
      p workspace.selected
      p "print out selected channel as the current recipient"
    when "E", "DETAILS"
      p "show details on the current recipient"
    when "F", "QUIT PROGRAM"
      exit_program = true
    else
      puts "Incorrect value, please try again"
    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME