# frozen_string_literal: true

require_relative 'password_generator'

def generate
  puts 'Enter length of your password:'
  print '> '
  size = gets.chomp.to_i
  password = password_generator(size)
  puts "Here is your password: #{password}"
  new_pass
end

def new_pass
  puts 'New one? [Y/n]'
  print '> '
  answer = gets.chomp.downcase
  answer == 'y' ? generate : false
end

generate
