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
    puts "F. Send Message"
    puts "G. Quit Program"
    puts
    user_input = gets.chomp.upcase
    puts

    case user_input
    when "A", "LIST USERS"
      workspace.users.each { |user| puts user.name }
    when "B", "LIST CHANNELS"
      workspace.channels.each { |channel| puts channel.name }
    when "C", "SELECT USER"
      puts "Please enter a Username or Slack ID:"
      input = gets.chomp
      workspace.select_user(input)
    when "D", "SELECT CHANNEL"
      puts "Please enter a Channel or Slack ID:"
      input = gets.chomp
      workspace.select_channel(input)
    when "E", "DETAILS"
      workspace.show_details
    when "F", "SEND MESSAGE"
      p "send a message to the current recipient"
      workspace.send_message

    when "G", "Q", "QUIT PROGRAM"
      exit_program = true
    else
      puts "Incorrect value, please try again"
    end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME