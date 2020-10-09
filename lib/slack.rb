#!/usr/bin/env ruby
require 'dotenv'
require 'httparty'

require_relative 'workspace'


def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  exit_program = false

  until exit_program
    puts
    puts "Please select an option:"
    puts "A. List Users"
    puts "B. List Channels"
    puts "C. Select User"
    puts "D. Select Channel"
    puts "E. Details"
    puts "F. Quit Program"
    puts
    user_input = gets.chomp.upcase
    puts

    case user_input
    when "A", "LIST USERS"
      workspace.users.each { |user| puts user.name }
    when "B", "LIST CHANNELS"
      workspace.channels.each { |channel| puts channel.name }
    when "C", "SELECT USER"
      user_name = gets.chomp
      workspace.select_user(user_name, nil)
    when "D", "SELECT CHANNEL"
      channel_name = gets.chomp
      workspace.select_channel(channel_name, nil)
    when "E", "DETAILS"
      p "show details on the current recipient"
      workspace.show_details
    when "F", "QUIT PROGRAM"
      exit_program = true
    else
      puts "Incorrect value, please try again"
    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME