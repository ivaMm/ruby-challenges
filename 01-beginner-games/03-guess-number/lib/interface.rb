# frozen_string_literal: true

require_relative 'guess_number'

def guess_number(num = 10)
  p '~ GUESS NUMBER ~'

  number = get_number(num)

  p "Guess number between 1 and #{num}!"
  print '> '
  start_time = Time.now
  answer = gets.chomp.to_i

  try = 0

  while answer != number
    try += 1
    p 'Try again!'
    print '> '
    answer = gets.chomp.to_i
  end

  elapsed = (Time.now - start_time).floor

  p "Yay! You guess the number #{number}"
  p "You needed #{pluralize(try, 'guess')} and #{pluralize(elapsed, 'second')}!"
  play_again
end

def pluralize(try, str)
  suff = (str.end_with?('s') ? 'es' : 's')
  try == 1 ? "#{try} #{str}" : "#{try} #{str}#{suff}"
end

def play_again
  p 'Play again? [Y/N]'
  print '> '
  answer = gets.chomp.downcase
  answer == 'y' ? guess_number : false
end

guess_number
