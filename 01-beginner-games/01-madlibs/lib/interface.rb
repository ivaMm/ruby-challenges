# frozen_string_literal: true

require_relative 'madlibs'

puts('~ MADLIBS ~')

# get user input:
print 'Adjective: '
adj1 = gets.chomp
print 'Adjective: '
adj2 = gets.chomp
print 'Adjective: '
adj3 = gets.chomp
print 'Noun: '
n1 = gets.chomp
print 'Noun: '
n2 = gets.chomp
print 'Noun: '
n3 = gets.chomp

p madlibs(adj1, adj2, adj3, n1, n2, n3)
